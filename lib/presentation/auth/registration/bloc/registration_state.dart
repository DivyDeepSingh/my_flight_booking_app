part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  factory RegistrationState({
    required bool isLoading,
    required bool isRegistered,
    String? errorMessage,

    required bool obscurePassword,
    required bool obscureConfirmPassword,
  }) = _RegistrationState;

  factory RegistrationState.initial() => RegistrationState(
    isLoading: false,
    isRegistered: false,
    errorMessage: null,

    obscurePassword: true,
    obscureConfirmPassword: true,
  );
}
