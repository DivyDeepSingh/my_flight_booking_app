import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_data_layer.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    // Reset state
    on<InitialLoginEvent>((event, emit) {
      emit(LoginState.initial());
    });

    // Login User Event
    on<OnLoginUserEvent>((event, emit) async {
      emit(LoginState.initial().copyWith(isLoading: true));

      var response = await AuthDataLayer().loginUser(
        email: event.email,
        password: event.password,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: failure.failureMessage,
              isLoggedIn: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              isLoggedIn: true,
              errorMessage: null,
            ),
          );
        },
      );
    });

    // Toggle password visibility
    on<OnTogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(obscurePassword: !state.obscurePassword));
    });
  }
}
