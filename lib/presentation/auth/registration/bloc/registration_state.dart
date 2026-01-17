part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  factory RegistrationState({
    required bool isLoading,
    required bool isRegistered, // ✅ registration success flag
    String? errorMessage, // ✅ error message for UI

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
