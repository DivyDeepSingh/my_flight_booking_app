import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:my_flight_booking_app/presentation/auth/login/page/login_screen.dart';
import 'package:my_flight_booking_app/presentation/chat_group/page/group_listing/groups_listing.dart';
import 'package:my_flight_booking_app/presentation/flight/bloc/flight_bloc.dart';
import 'package:my_flight_booking_app/presentation/flight/page/flight_booking/my_booked_flights.dart';
import 'package:my_flight_booking_app/presentation/flight/page/flight_search.dart';
import 'package:my_flight_booking_app/presentation/home/widget/option_card.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(
          'FlyEasy',
          style: TextStyle(
            color: ColorManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        actions: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (!state.isLoggedIn) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false,
                );
              }
            },
            child: IconButton(
              icon: Icon(Icons.logout, color: ColorManager.white),
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(OnLogoutEvent());
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '✈️ FlyEasy',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Book flights, join chats, and manage bookings easily!',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorManager.blackLight,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              OptionCard(
                icon: Icons.group,
                title: 'Chat Groups',
                subtitle: 'Join and chat with other travelers',
                color: ColorManager.secondary.withOpacity(0.5),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GroupsListing()),
                ),
              ),
              SizedBox(height: 20.h),
              OptionCard(
                icon: Icons.search,
                title: 'Search Flights',
                subtitle: 'Find the best flights',
                color: ColorManager.primary,
                onTap: () {
                  BlocProvider.of<FlightBloc>(
                    context,
                  ).add(InitialFlightEvent());

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FlightSearchScreen()),
                  );
                },
              ),
              SizedBox(height: 20.h),

              OptionCard(
                icon: Icons.book_online,
                title: 'My Bookings',
                subtitle: 'View your booked flights',
                color: ColorManager.secondary.withOpacity(0.8),
                onTap: () {
                  BlocProvider.of<FlightBloc>(
                    context,
                  ).add(MyBookedFlightsEvent());

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyBookedFlightsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
