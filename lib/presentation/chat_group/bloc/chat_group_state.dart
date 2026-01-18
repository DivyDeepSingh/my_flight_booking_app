part of 'chat_group_bloc.dart';

@freezed
class ChatGroupState with _$ChatGroupState {
  factory ChatGroupState({
    // Loading states
    required bool isLoadingGroups,
    required bool isLoadingMessages,
    required bool isLoadingUsers,
    required bool isCreatingGroup,

    // Data
    required List<GroupModel> groups,
    required List<MessageModel> messages,
    required List<UserModel> users,
    required List<String> selectedUserIds,

    String? currentGroupId,
    String? lastCreatedGroupId,
    String? currentUserId,
    String? currentUsername,

    // Errors
    String? groupError,
    String? messageError,
    String? usersError,
    String? successOrFailure,
  }) = _ChatGroupState;

  factory ChatGroupState.initial() => ChatGroupState(
    isLoadingGroups: false,
    isLoadingMessages: false,
    isCreatingGroup: false,
    isLoadingUsers: false,
    groups: [],
    messages: [],
    users: [],
    selectedUserIds: [],
    currentGroupId: null,
    lastCreatedGroupId: null,
    currentUserId: null,

    currentUsername: null,
    groupError: null,
    messageError: null,
    successOrFailure: null,
  );
}
