part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  factory RegistrationState({required bool isLoading}) = _RegistrationState;

  factory RegistrationState.initial() => RegistrationState(isLoading: false);
}
