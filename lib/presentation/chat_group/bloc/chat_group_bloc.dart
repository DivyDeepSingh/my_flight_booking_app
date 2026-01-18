import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/models/group_model.dart';
import 'package:my_flight_booking_app/models/user_model.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_repository.dart';
import 'package:my_flight_booking_app/presentation/chat_group/chat_group_data_layer.dart';
import 'package:my_flight_booking_app/presentation/chat_group/chat_group_repository.dart';
import 'package:my_flight_booking_app/models/message_model.dart';
import 'package:my_flight_booking_app/use_case/message_storage_helper.dart'; // Import Message model

part 'chat_group_event.dart';
part 'chat_group_state.dart';
part 'chat_group_bloc.freezed.dart';

class ChatGroupBloc extends Bloc<ChatGroupEvent, ChatGroupState> {
  final ChatGroupRepository repo;
  final ChatGroupDataLayer dataLayer;
  final AuthRepository authRepository;
  final MessageStorageHelper messageStorageHelper;

  StreamSubscription? _groupsSubscription;
  StreamSubscription? _messagesSubscription;

  ChatGroupBloc({
    required this.repo,
    required this.dataLayer,
    required this.authRepository,
    required this.messageStorageHelper,
  }) : super(ChatGroupState.initial()) {
    on<OnInitialChatGroupEvent>((event, emit) async {
      emit(ChatGroupState.initial());
      var userId = await authRepository.getUserId();
      if (userId == null) {
        add(OnInitialChatGroupEvent());
        return;
      }
      String userName = await repo.getUserNameById(userId!);

      emit(state.copyWith(currentUserId: userId, currentUsername: userName));

      add(OnLoadUserGroupsEvent(userId: userId));
    });

    on<OnLoadAllUsersEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingUsers: true,
          usersError: null,
          selectedUserIds: [],
          lastCreatedGroupId: null,
        ),
      );

      final result = await dataLayer.getAllUsers();

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingUsers: false,
              usersError: failure.failureMessage,
            ),
          );
        },
        (users) {
          emit(state.copyWith(isLoadingUsers: false, users: users));
        },
      );
    });

    on<OnToggleUserSelectionEvent>((event, emit) {
      final current = List<String>.from(state.selectedUserIds ?? []);
      if (current.contains(event.userId)) {
        current.remove(event.userId);
      } else {
        current.add(event.userId);
      }
      emit(state.copyWith(selectedUserIds: current));
    });

    on<CreateGroupEvent>((event, emit) async {
      emit(state.copyWith(isCreatingGroup: true));
      final result = await dataLayer.createGroup(
        name: event.name,
        ownerId: state.currentUserId!,
        members: [...state.selectedUserIds, state.currentUserId!],
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            isCreatingGroup: false,
            groupError: failure.failureMessage,
          ),
        ),
        (groupId) => emit(
          state.copyWith(isCreatingGroup: false, lastCreatedGroupId: groupId),
        ),
      );
    });

    on<OnLoadUserGroupsEvent>((event, emit) async {
      emit(state.copyWith(isLoadingGroups: true));

      await _groupsSubscription?.cancel();
      _groupsSubscription = repo
          .getUserGroups(event.userId)
          .listen(
            (groups) {
              List<GroupModel> groupList = List.generate(
                groups.length,
                (index) => GroupModel.fromJson(groups[index]),
              );
              add(OnUserGroupsUpdatedEvent(groups: groupList));
            },
            onError: (error) {
              emit(
                state.copyWith(
                  isLoadingGroups: false,
                  groupError: error.toString(),
                ),
              );
            },
          );
    });

    on<OnUserGroupsUpdatedEvent>((event, emit) {
      emit(
        state.copyWith(
          isLoadingGroups: false,
          groups: event.groups,
          groupError: null,
          lastCreatedGroupId: null,
        ),
      );
    });

    on<LoadGroupMessagesEvent>((event, emit) async {
      emit(
        state.copyWith(isLoadingMessages: true, currentGroupId: event.groupId),
      );

      final localMessages = await messageStorageHelper.getMessagesByGroupId(
        event.groupId,
      );

      emit(state.copyWith(isLoadingMessages: false, messages: localMessages));

      await _messagesSubscription?.cancel();
      _messagesSubscription = repo
          .getGroupMessages(event.groupId)
          .listen(
            (messages) {
              List<MessageModel> messagesList = List.generate(
                messages.length,
                (index) => MessageModel.fromJson(messages[index]),
              );
              add(GroupMessagesUpdatedEvent(messages: messagesList));
            },
            onError: (error) {
              emit(
                state.copyWith(
                  isLoadingMessages: false,
                  messageError: error.toString(),
                ),
              );
            },
          );
    });

    on<GroupMessagesUpdatedEvent>((event, emit) async {
      emit(
        state.copyWith(
          isLoadingMessages: false,
          messages: event.messages,
          messageError: null,
        ),
      );

      for (var message in event.messages) {
        final messageModel = MessageModel(
          senderId: message.senderId,
          groupId: message.groupId,
          message: message.message,
          createdAt: DateTime.now().toIso8601String(),
          senderName: message.senderName ?? "",
        );
        await messageStorageHelper.insertMessage(messageModel);
      }
    });

    on<SendMessageEvent>((event, emit) async {
      final result = await dataLayer.sendMessage(
        groupId: event.groupId,
        senderId: event.senderId,
        message: event.message,
        senderName: state.currentUsername ?? "",
      );

      result.fold(
        (failure) => emit(state.copyWith(messageError: failure.failureMessage)),
        (_) => null,
      );

      final message = MessageModel(
        senderId: event.senderId,
        groupId: event.groupId,
        message: event.message,
        createdAt: DateTime.now().toIso8601String(),
        senderName: state.currentUsername ?? "",
      );
      await messageStorageHelper.insertMessage(message);
    });

    on<LeaveGroupEvent>((event, emit) async {
      final result = await dataLayer.leaveGroup(
        groupId: event.groupId,
        userId: state.currentUserId!,
      );
      result.fold(
        (failure) => emit(state.copyWith(groupError: failure.failureMessage)),
        (_) => null,
      );
    });
  }

  @override
  Future<void> close() async {
    await _groupsSubscription?.cancel();
    await _messagesSubscription?.cancel();
    return super.close();
  }
}
