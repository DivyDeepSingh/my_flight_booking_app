// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatGroupState {
// Loading states
  bool get isLoadingGroups => throw _privateConstructorUsedError;
  bool get isLoadingMessages => throw _privateConstructorUsedError;
  bool get isLoadingUsers => throw _privateConstructorUsedError;
  bool get isCreatingGroup => throw _privateConstructorUsedError; // Data
  List<GroupModel> get groups => throw _privateConstructorUsedError;
  List<MessageModel> get messages => throw _privateConstructorUsedError;
  List<UserModel> get users => throw _privateConstructorUsedError;
  List<String> get selectedUserIds => throw _privateConstructorUsedError;
  String? get currentGroupId => throw _privateConstructorUsedError;
  String? get lastCreatedGroupId => throw _privateConstructorUsedError;
  String? get currentUserId => throw _privateConstructorUsedError;
  String? get currentUsername => throw _privateConstructorUsedError; // Errors
  String? get groupError => throw _privateConstructorUsedError;
  String? get messageError => throw _privateConstructorUsedError;
  String? get usersError => throw _privateConstructorUsedError;
  String? get successOrFailure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatGroupStateCopyWith<ChatGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGroupStateCopyWith<$Res> {
  factory $ChatGroupStateCopyWith(
          ChatGroupState value, $Res Function(ChatGroupState) then) =
      _$ChatGroupStateCopyWithImpl<$Res, ChatGroupState>;
  @useResult
  $Res call(
      {bool isLoadingGroups,
      bool isLoadingMessages,
      bool isLoadingUsers,
      bool isCreatingGroup,
      List<GroupModel> groups,
      List<MessageModel> messages,
      List<UserModel> users,
      List<String> selectedUserIds,
      String? currentGroupId,
      String? lastCreatedGroupId,
      String? currentUserId,
      String? currentUsername,
      String? groupError,
      String? messageError,
      String? usersError,
      String? successOrFailure});
}

/// @nodoc
class _$ChatGroupStateCopyWithImpl<$Res, $Val extends ChatGroupState>
    implements $ChatGroupStateCopyWith<$Res> {
  _$ChatGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingGroups = null,
    Object? isLoadingMessages = null,
    Object? isLoadingUsers = null,
    Object? isCreatingGroup = null,
    Object? groups = null,
    Object? messages = null,
    Object? users = null,
    Object? selectedUserIds = null,
    Object? currentGroupId = freezed,
    Object? lastCreatedGroupId = freezed,
    Object? currentUserId = freezed,
    Object? currentUsername = freezed,
    Object? groupError = freezed,
    Object? messageError = freezed,
    Object? usersError = freezed,
    Object? successOrFailure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingGroups: null == isLoadingGroups
          ? _value.isLoadingGroups
          : isLoadingGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMessages: null == isLoadingMessages
          ? _value.isLoadingMessages
          : isLoadingMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _value.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingGroup: null == isCreatingGroup
          ? _value.isCreatingGroup
          : isCreatingGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      selectedUserIds: null == selectedUserIds
          ? _value.selectedUserIds
          : selectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentGroupId: freezed == currentGroupId
          ? _value.currentGroupId
          : currentGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCreatedGroupId: freezed == lastCreatedGroupId
          ? _value.lastCreatedGroupId
          : lastCreatedGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUserId: freezed == currentUserId
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUsername: freezed == currentUsername
          ? _value.currentUsername
          : currentUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      groupError: freezed == groupError
          ? _value.groupError
          : groupError // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
      usersError: freezed == usersError
          ? _value.usersError
          : usersError // ignore: cast_nullable_to_non_nullable
              as String?,
      successOrFailure: freezed == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatGroupStateImplCopyWith<$Res>
    implements $ChatGroupStateCopyWith<$Res> {
  factory _$$ChatGroupStateImplCopyWith(_$ChatGroupStateImpl value,
          $Res Function(_$ChatGroupStateImpl) then) =
      __$$ChatGroupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingGroups,
      bool isLoadingMessages,
      bool isLoadingUsers,
      bool isCreatingGroup,
      List<GroupModel> groups,
      List<MessageModel> messages,
      List<UserModel> users,
      List<String> selectedUserIds,
      String? currentGroupId,
      String? lastCreatedGroupId,
      String? currentUserId,
      String? currentUsername,
      String? groupError,
      String? messageError,
      String? usersError,
      String? successOrFailure});
}

/// @nodoc
class __$$ChatGroupStateImplCopyWithImpl<$Res>
    extends _$ChatGroupStateCopyWithImpl<$Res, _$ChatGroupStateImpl>
    implements _$$ChatGroupStateImplCopyWith<$Res> {
  __$$ChatGroupStateImplCopyWithImpl(
      _$ChatGroupStateImpl _value, $Res Function(_$ChatGroupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingGroups = null,
    Object? isLoadingMessages = null,
    Object? isLoadingUsers = null,
    Object? isCreatingGroup = null,
    Object? groups = null,
    Object? messages = null,
    Object? users = null,
    Object? selectedUserIds = null,
    Object? currentGroupId = freezed,
    Object? lastCreatedGroupId = freezed,
    Object? currentUserId = freezed,
    Object? currentUsername = freezed,
    Object? groupError = freezed,
    Object? messageError = freezed,
    Object? usersError = freezed,
    Object? successOrFailure = freezed,
  }) {
    return _then(_$ChatGroupStateImpl(
      isLoadingGroups: null == isLoadingGroups
          ? _value.isLoadingGroups
          : isLoadingGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMessages: null == isLoadingMessages
          ? _value.isLoadingMessages
          : isLoadingMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingUsers: null == isLoadingUsers
          ? _value.isLoadingUsers
          : isLoadingUsers // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingGroup: null == isCreatingGroup
          ? _value.isCreatingGroup
          : isCreatingGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      selectedUserIds: null == selectedUserIds
          ? _value._selectedUserIds
          : selectedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentGroupId: freezed == currentGroupId
          ? _value.currentGroupId
          : currentGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCreatedGroupId: freezed == lastCreatedGroupId
          ? _value.lastCreatedGroupId
          : lastCreatedGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUserId: freezed == currentUserId
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUsername: freezed == currentUsername
          ? _value.currentUsername
          : currentUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      groupError: freezed == groupError
          ? _value.groupError
          : groupError // ignore: cast_nullable_to_non_nullable
              as String?,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
      usersError: freezed == usersError
          ? _value.usersError
          : usersError // ignore: cast_nullable_to_non_nullable
              as String?,
      successOrFailure: freezed == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatGroupStateImpl implements _ChatGroupState {
  _$ChatGroupStateImpl(
      {required this.isLoadingGroups,
      required this.isLoadingMessages,
      required this.isLoadingUsers,
      required this.isCreatingGroup,
      required final List<GroupModel> groups,
      required final List<MessageModel> messages,
      required final List<UserModel> users,
      required final List<String> selectedUserIds,
      this.currentGroupId,
      this.lastCreatedGroupId,
      this.currentUserId,
      this.currentUsername,
      this.groupError,
      this.messageError,
      this.usersError,
      this.successOrFailure})
      : _groups = groups,
        _messages = messages,
        _users = users,
        _selectedUserIds = selectedUserIds;

// Loading states
  @override
  final bool isLoadingGroups;
  @override
  final bool isLoadingMessages;
  @override
  final bool isLoadingUsers;
  @override
  final bool isCreatingGroup;
// Data
  final List<GroupModel> _groups;
// Data
  @override
  List<GroupModel> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  final List<MessageModel> _messages;
  @override
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<UserModel> _users;
  @override
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<String> _selectedUserIds;
  @override
  List<String> get selectedUserIds {
    if (_selectedUserIds is EqualUnmodifiableListView) return _selectedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedUserIds);
  }

  @override
  final String? currentGroupId;
  @override
  final String? lastCreatedGroupId;
  @override
  final String? currentUserId;
  @override
  final String? currentUsername;
// Errors
  @override
  final String? groupError;
  @override
  final String? messageError;
  @override
  final String? usersError;
  @override
  final String? successOrFailure;

  @override
  String toString() {
    return 'ChatGroupState(isLoadingGroups: $isLoadingGroups, isLoadingMessages: $isLoadingMessages, isLoadingUsers: $isLoadingUsers, isCreatingGroup: $isCreatingGroup, groups: $groups, messages: $messages, users: $users, selectedUserIds: $selectedUserIds, currentGroupId: $currentGroupId, lastCreatedGroupId: $lastCreatedGroupId, currentUserId: $currentUserId, currentUsername: $currentUsername, groupError: $groupError, messageError: $messageError, usersError: $usersError, successOrFailure: $successOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatGroupStateImpl &&
            (identical(other.isLoadingGroups, isLoadingGroups) ||
                other.isLoadingGroups == isLoadingGroups) &&
            (identical(other.isLoadingMessages, isLoadingMessages) ||
                other.isLoadingMessages == isLoadingMessages) &&
            (identical(other.isLoadingUsers, isLoadingUsers) ||
                other.isLoadingUsers == isLoadingUsers) &&
            (identical(other.isCreatingGroup, isCreatingGroup) ||
                other.isCreatingGroup == isCreatingGroup) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._selectedUserIds, _selectedUserIds) &&
            (identical(other.currentGroupId, currentGroupId) ||
                other.currentGroupId == currentGroupId) &&
            (identical(other.lastCreatedGroupId, lastCreatedGroupId) ||
                other.lastCreatedGroupId == lastCreatedGroupId) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId) &&
            (identical(other.currentUsername, currentUsername) ||
                other.currentUsername == currentUsername) &&
            (identical(other.groupError, groupError) ||
                other.groupError == groupError) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.usersError, usersError) ||
                other.usersError == usersError) &&
            (identical(other.successOrFailure, successOrFailure) ||
                other.successOrFailure == successOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingGroups,
      isLoadingMessages,
      isLoadingUsers,
      isCreatingGroup,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_selectedUserIds),
      currentGroupId,
      lastCreatedGroupId,
      currentUserId,
      currentUsername,
      groupError,
      messageError,
      usersError,
      successOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatGroupStateImplCopyWith<_$ChatGroupStateImpl> get copyWith =>
      __$$ChatGroupStateImplCopyWithImpl<_$ChatGroupStateImpl>(
          this, _$identity);
}

abstract class _ChatGroupState implements ChatGroupState {
  factory _ChatGroupState(
      {required final bool isLoadingGroups,
      required final bool isLoadingMessages,
      required final bool isLoadingUsers,
      required final bool isCreatingGroup,
      required final List<GroupModel> groups,
      required final List<MessageModel> messages,
      required final List<UserModel> users,
      required final List<String> selectedUserIds,
      final String? currentGroupId,
      final String? lastCreatedGroupId,
      final String? currentUserId,
      final String? currentUsername,
      final String? groupError,
      final String? messageError,
      final String? usersError,
      final String? successOrFailure}) = _$ChatGroupStateImpl;

  @override // Loading states
  bool get isLoadingGroups;
  @override
  bool get isLoadingMessages;
  @override
  bool get isLoadingUsers;
  @override
  bool get isCreatingGroup;
  @override // Data
  List<GroupModel> get groups;
  @override
  List<MessageModel> get messages;
  @override
  List<UserModel> get users;
  @override
  List<String> get selectedUserIds;
  @override
  String? get currentGroupId;
  @override
  String? get lastCreatedGroupId;
  @override
  String? get currentUserId;
  @override
  String? get currentUsername;
  @override // Errors
  String? get groupError;
  @override
  String? get messageError;
  @override
  String? get usersError;
  @override
  String? get successOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$ChatGroupStateImplCopyWith<_$ChatGroupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
