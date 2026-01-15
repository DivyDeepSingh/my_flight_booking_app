import 'package:dartz/dartz.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_repository.dart';

class AuthDataLayer {
  final AuthRepository _authRepository = AuthRepository();

  Future<Either<ApiFailure, bool>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      await _authRepository.registerUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      return Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Future<Either<ApiFailure, bool>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.loginUser(email: email, password: password);
      return Right(true);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
