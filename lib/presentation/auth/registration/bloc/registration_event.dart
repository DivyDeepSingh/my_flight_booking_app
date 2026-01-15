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
