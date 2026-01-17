import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/auth/login/bloc/login_bloc.dart';

import 'package:my_flight_booking_app/presentation/auth/login/page/login_screen.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<RegistrationBloc>(
              create: (context) => RegistrationBloc(),
            ),
            BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Flight Booking App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
