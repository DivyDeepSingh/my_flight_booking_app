import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flight_booking_app/presentation/auth/login/page/login_Screen.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_listing/groups_listing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    // Firebase sign out
    await FirebaseAuth.instance.signOut();

    // Remove user ID from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');

    // Navigate to Login Screen
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GroupsListing());
  }
}
