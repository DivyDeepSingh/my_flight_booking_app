import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/exception.dart';

class FailureHandler {
  static ApiFailure handleFailure(Object error) {
    switch (error.runtimeType) {
      case MockException:
        return ApiFailure.other((error as MockException).message);

      case CacheException:
        return ApiFailure.other((error as CacheException).message);

      case ServerException:
        final message = (error as ServerException).message;
        return ApiFailure.serverError(message);

      case SocketException:
        return ApiFailure.poorConnection();

      case TimeoutException:
        return const ApiFailure.serverTimeout();

      case PlatformException:
        return ApiFailure.other('${(error as PlatformException).message}');

      case OtherException:
        return ApiFailure.other((error as OtherException).message);

      case FirebaseAuthException:
        final e = error as FirebaseAuthException;
        switch (e.code) {
          case 'email-already-in-use':
            return ApiFailure.other("This email is already in use");
          case 'weak-password':
            return ApiFailure.other("The password is too weak");
          case 'user-not-found':
            return ApiFailure.other("No user found with this email");
          case 'wrong-password':
            return ApiFailure.other("Incorrect password");
          default:
            return ApiFailure.other(
              e.message ?? "Firebase Authentication error",
            );
        }

      case FirebaseException:
        return ApiFailure.serverError(
          (error as FirebaseException).message ?? "Firebase error",
        );

      default:
        return ApiFailure.other(error.toString());
    }
  }
}
