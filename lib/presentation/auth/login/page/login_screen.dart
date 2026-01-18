import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/auth/login/bloc/login_bloc.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/registration_screen.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/input_textfield.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/password_textfield.dart';
import 'package:my_flight_booking_app/presentation/chat_group/bloc/chat_group_bloc.dart';
import 'package:my_flight_booking_app/presentation/home/home.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.successOrFailue != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successOrFailue!),
                backgroundColor: ColorManager.error,
              ),
            );
          }
          if (state.isLoggedIn) {
            BlocProvider.of<ChatGroupBloc>(
              context,
            ).add(OnInitialChatGroupEvent());

            BlocProvider.of<ChatGroupBloc>(context).add(OnLoadAllUsersEvent());

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => HomeScreen()),
              (route) => false,
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),

                  // 🔹 Header
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.flight_land,
                          size: 80.sp,
                          color: ColorManager.primary,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Welcome Traveller!",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Login to continue your journey!",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  InputTextfield(
                    controller: _emailController,
                    label: "Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!value.contains("@")) return "Enter valid email";
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // --- Password Field ---
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return PasswordTextfield(
                        controller: _passwordController,
                        label: "Password",
                        obscureText: state.obscurePassword,
                        onToggle: () {
                          context.read<LoginBloc>().add(
                            OnTogglePasswordVisibilityEvent(),
                          );
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  SizedBox(height: 30.h),

                  // --- Login Button ---
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return SizedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            backgroundColor: ColorManager.primary,
                          ),
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(
                                      OnLoginUserEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                                  }
                                },
                          child: state.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: ColorManager.white,
                                  ),
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.white,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 16.h),

                  // --- Register Navigation ---
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "Register",
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
