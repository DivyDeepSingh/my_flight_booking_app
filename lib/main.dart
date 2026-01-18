import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flight_booking_app/models/message_model.dart';
import 'package:my_flight_booking_app/presentation/auth/auth_repository.dart';
import 'package:my_flight_booking_app/presentation/auth/login/bloc/login_bloc.dart';

import 'package:my_flight_booking_app/presentation/auth/login/page/login_screen.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/registration_screen.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/chat_group/chat_group_data_layer.dart';
import 'package:my_flight_booking_app/presentation/chat_group/chat_group_repository.dart';
import 'package:my_flight_booking_app/presentation/flight/bloc/flight_bloc.dart';
import 'package:my_flight_booking_app/presentation/flight/flight_data_layer.dart';
import 'package:my_flight_booking_app/use_case/message_storage_helper.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Hive
  await Hive.initFlutter();

  await Firebase.initializeApp();

  Hive.registerAdapter(MessageModelAdapter());

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
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc()..add(InitialLoginEvent()),
            ),

            BlocProvider<ChatGroupBloc>(
              create: (context) => ChatGroupBloc(
                repo: ChatGroupRepository(),
                dataLayer: ChatGroupDataLayer(),
                authRepository: AuthRepository(),
                messageStorageHelper: MessageStorageHelper(),
              ),
            ),

            BlocProvider<FlightBloc>(
              create: (context) => FlightBloc(dataLayer: FlightDataLayer()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Flight Booking App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: ColorManager.tertiary,
              ),
              useMaterial3: true,
            ),
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: child,
              );
            },
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
