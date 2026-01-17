import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/presentation/auth/registration/bloc/registration_bloc.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/input_textfield.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/password_textfield.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: ColorManager.error,
              ),
            );
          }

          if (state.isRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Registration successful!"),
                backgroundColor: ColorManager.primary,
              ),
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
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.flight_takeoff,
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
                          "Join us and start your journey!",
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
                    controller: _nameController,
                    label: "Full Name",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

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

                  InputTextfield(
                    controller: _phoneController,
                    label: "Phone Number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      }
                      if (value.length != 10) {
                        return "Phone number must be 10 digits";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          PasswordTextfield(
                            controller: _passwordController,
                            label: "Password",
                            obscureText: state.obscurePassword,
                            onToggle: () {
                              context.read<RegistrationBloc>().add(
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
                          ),
                          SizedBox(height: 16.h),
                          PasswordTextfield(
                            controller: _confirmPasswordController,
                            label: "Confirm Password",
                            obscureText: state.obscureConfirmPassword,
                            onToggle: () {
                              context.read<RegistrationBloc>().add(
                                OnToggleConfirmPasswordVisibilityEvent(),
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Confirm your password";
                              }
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30.h),

                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 50.h,
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
                                    context.read<RegistrationBloc>().add(
                                      OnRegisterUserEvent(
                                        email: _emailController.text,
                                        name: _nameController.text,
                                        password: _passwordController.text,
                                        phoneNumber: _phoneController.text,
                                      ),
                                    );
                                  }
                                },
                          child: state.isLoading
                              ? CircularProgressIndicator(
                                  color: ColorManager.white,
                                )
                              : Text(
                                  "Register",
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

                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
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

// ====================== Reusable Widgets ======================
