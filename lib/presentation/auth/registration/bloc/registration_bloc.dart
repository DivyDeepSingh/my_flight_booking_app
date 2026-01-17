import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_data_layer.dart';

part 'registration_event.dart';
part 'registration_state.dart';
part 'registration_bloc.freezed.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState.initial()) {
    on<InitialRegistrationEvent>((event, emit) {
      emit(RegistrationState.initial());
    });

    on<OnRegisterUserEvent>((event, emit) async {
      emit(RegistrationState.initial().copyWith(isLoading: true));
      var response = await AuthDataLayer().registerUser(
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phoneNumber,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: failure.failureMessage,
              isRegistered: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              isRegistered: true,
              errorMessage: null,
            ),
          );
        },
      );
    });

    on<OnTogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(obscurePassword: !state.obscurePassword));
    });

    on<OnToggleConfirmPasswordVisibilityEvent>((event, emit) {
      emit(
        state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword),
      );
    });
  }
}
