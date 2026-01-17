// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegistrationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRegistered =>
      throw _privateConstructorUsedError; // ✅ registration success flag
  String? get errorMessage =>
      throw _privateConstructorUsedError; // ✅ error message for UI
  bool get obscurePassword => throw _privateConstructorUsedError;
  bool get obscureConfirmPassword => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationStateCopyWith<RegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
    RegistrationState value,
    $Res Function(RegistrationState) then,
  ) = _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isRegistered,
    String? errorMessage,
    bool obscurePassword,
    bool obscureConfirmPassword,
  });
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRegistered = null,
    Object? errorMessage = freezed,
    Object? obscurePassword = null,
    Object? obscureConfirmPassword = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRegistered: null == isRegistered
                ? _value.isRegistered
                : isRegistered // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            obscurePassword: null == obscurePassword
                ? _value.obscurePassword
                : obscurePassword // ignore: cast_nullable_to_non_nullable
                      as bool,
            obscureConfirmPassword: null == obscureConfirmPassword
                ? _value.obscureConfirmPassword
                : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegistrationStateImplCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$$RegistrationStateImplCopyWith(
    _$RegistrationStateImpl value,
    $Res Function(_$RegistrationStateImpl) then,
  ) = __$$RegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isRegistered,
    String? errorMessage,
    bool obscurePassword,
    bool obscureConfirmPassword,
  });
}

/// @nodoc
class __$$RegistrationStateImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationStateImpl>
    implements _$$RegistrationStateImplCopyWith<$Res> {
  __$$RegistrationStateImplCopyWithImpl(
    _$RegistrationStateImpl _value,
    $Res Function(_$RegistrationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRegistered = null,
    Object? errorMessage = freezed,
    Object? obscurePassword = null,
    Object? obscureConfirmPassword = null,
  }) {
    return _then(
      _$RegistrationStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRegistered: null == isRegistered
            ? _value.isRegistered
            : isRegistered // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        obscurePassword: null == obscurePassword
            ? _value.obscurePassword
            : obscurePassword // ignore: cast_nullable_to_non_nullable
                  as bool,
        obscureConfirmPassword: null == obscureConfirmPassword
            ? _value.obscureConfirmPassword
            : obscureConfirmPassword // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$RegistrationStateImpl implements _RegistrationState {
  _$RegistrationStateImpl({
    required this.isLoading,
    required this.isRegistered,
    this.errorMessage,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
  });

  @override
  final bool isLoading;
  @override
  final bool isRegistered;
  // ✅ registration success flag
  @override
  final String? errorMessage;
  // ✅ error message for UI
  @override
  final bool obscurePassword;
  @override
  final bool obscureConfirmPassword;

  @override
  String toString() {
    return 'RegistrationState(isLoading: $isLoading, isRegistered: $isRegistered, errorMessage: $errorMessage, obscurePassword: $obscurePassword, obscureConfirmPassword: $obscureConfirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.obscureConfirmPassword, obscureConfirmPassword) ||
                other.obscureConfirmPassword == obscureConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isRegistered,
    errorMessage,
    obscurePassword,
    obscureConfirmPassword,
  );

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      __$$RegistrationStateImplCopyWithImpl<_$RegistrationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RegistrationState implements RegistrationState {
  factory _RegistrationState({
    required final bool isLoading,
    required final bool isRegistered,
    final String? errorMessage,
    required final bool obscurePassword,
    required final bool obscureConfirmPassword,
  }) = _$RegistrationStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isRegistered; // ✅ registration success flag
  @override
  String? get errorMessage; // ✅ error message for UI
  @override
  bool get obscurePassword;
  @override
  bool get obscureConfirmPassword;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
