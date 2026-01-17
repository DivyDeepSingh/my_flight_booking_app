part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    required bool isLoggedIn,
    required bool obscurePassword,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    isLoading: false,
    isLoggedIn: false,
    obscurePassword: true,
    errorMessage: null,
  );
}
