import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flight_booking_app/core/error/exception.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register User
  /// Returns true if successful
  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      // 1️⃣ Check if phone already exists
      var phoneQuery = await _firestore
          .collection('users')
          .where('phone', isEqualTo: phone)
          .get();

      if (phoneQuery.docs.isNotEmpty) {
        throw OtherException(message: "This phone number is already in use");
      }

      // 2️⃣ Create user in FirebaseAuth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // 3️⃣ Save extra info in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true; // ✅ success
    } catch (e) {
      rethrow;
    }
  }

  /// Login User
  /// Returns true if successful
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true; // ✅ success
    } catch (e) {
      rethrow;
    }
  }

  /// Logout
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
