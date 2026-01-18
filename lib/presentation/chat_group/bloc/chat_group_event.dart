part of 'chat_group_bloc.dart';

abstract class ChatGroupEvent {
  const ChatGroupEvent();
}

class OnInitialChatGroupEvent extends ChatGroupEvent {
  OnInitialChatGroupEvent();
}

class OnLoadAllUsersEvent extends ChatGroupEvent {
  OnLoadAllUsersEvent();
}

class OnLoadUserGroupsEvent extends ChatGroupEvent {
  final String userId;
  OnLoadUserGroupsEvent({required this.userId});
}

class OnToggleUserSelectionEvent extends ChatGroupEvent {
  final String userId;
  OnToggleUserSelectionEvent({required this.userId});
}

class OnUserGroupsUpdatedEvent extends ChatGroupEvent {
  final List<GroupModel> groups;
  OnUserGroupsUpdatedEvent({required this.groups});
}

class LoadGroupMessagesEvent extends ChatGroupEvent {
  final String groupId;
  LoadGroupMessagesEvent({required this.groupId});
}

class GroupMessagesUpdatedEvent extends ChatGroupEvent {
  final List<MessageModel> messages;
  GroupMessagesUpdatedEvent({required this.messages});
}

class CreateGroupEvent extends ChatGroupEvent {
  final String name;

  CreateGroupEvent({required this.name});
}

class SendMessageEvent extends ChatGroupEvent {
  final String groupId;
  final String senderId;
  final String message;

  SendMessageEvent({
    required this.groupId,
    required this.senderId,
    required this.message,
  });
}

class LeaveGroupEvent extends ChatGroupEvent {
  final String groupId;

  LeaveGroupEvent({required this.groupId});
}
