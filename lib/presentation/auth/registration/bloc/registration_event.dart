part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();
}

class InitialRegistrationEvent extends RegistrationEvent {
  InitialRegistrationEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnRegisterUserEvent extends RegistrationEvent {
  String name, email, password, phoneNumber;
  OnRegisterUserEvent({
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnTogglePasswordVisibilityEvent extends RegistrationEvent {
  OnTogglePasswordVisibilityEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnToggleConfirmPasswordVisibilityEvent extends RegistrationEvent {
  OnToggleConfirmPasswordVisibilityEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
