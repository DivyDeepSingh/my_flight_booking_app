part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class InitialLoginEvent extends LoginEvent {
  InitialLoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoginUserEvent extends LoginEvent {
  String email, password;
  OnLoginUserEvent({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnTogglePasswordVisibilityEvent extends LoginEvent {
  OnTogglePasswordVisibilityEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLogoutEvent extends LoginEvent {
  OnLogoutEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
