import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flight_booking_app/core/error/exception.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register User
  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      // 1️⃣ Phone uniqueness check
      var phoneQuery = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .get();

      if (phoneQuery.docs.isNotEmpty) {
        throw OtherException(message: "This phone number is already in use");
      }

      // 2️⃣ FirebaseAuth create user
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // 3️⃣ Save extra fields in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw FailureHandler.handleFailure(e);
    }
  }

  /// Login User
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // FirebaseAuth login
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw FailureHandler.handleFailure(e);
    }
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
