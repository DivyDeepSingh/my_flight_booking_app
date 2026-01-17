import 'package:dartz/dartz.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataLayer {
  final AuthRepository _authRepository;

  AuthDataLayer({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepository();

  /// Registers a new user
  Future<Either<ApiFailure, bool>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final bool isRegistered = await _authRepository.registerUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

      if (isRegistered) {
        return const Right(true);
      } else {
        return Left(ApiFailure.other("Registration failed"));
      }
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }

  /// Logs in an existing user
  Future<Either<ApiFailure, bool>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final bool isLoggedIn = await _authRepository.loginUser(
        email: email,
        password: password,
      );

      if (isLoggedIn) {
        return const Right(true);
      } else {
        return Left(ApiFailure.other("Login failed"));
      }
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }
}
