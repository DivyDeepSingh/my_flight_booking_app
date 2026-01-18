import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_data_layer.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_repository.dart';
import 'package:my_flight_booking_app/presentation/home/home.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    // Reset state
    on<InitialLoginEvent>((event, emit) async {
      emit(LoginState.initial());

      bool isUserLoggedIn = await AuthRepository().isUserLoggedIn();

      emit(state.copyWith(isLoading: false, isLoggedIn: isUserLoggedIn));
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
              successOrFailue: failure.failureMessage,
              isLoggedIn: false,
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              isLoggedIn: true,
              successOrFailue: "Login successful!",
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
