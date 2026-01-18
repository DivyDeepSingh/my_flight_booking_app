import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class PasswordTextfield extends StatelessWidget {
  final TextEditingController controller;

  final String label;
  final bool obscureText;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const PasswordTextfield({
    required this.controller,
    required this.label,
    required this.obscureText,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: ColorManager.white,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManager.primary.withOpacity(0.5), // normal border
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManager.primary.withOpacity(0.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorManager.primary, // highlight border
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.error, width: 2),
        ),

        prefixIcon: Icon(Icons.lock, color: ColorManager.primary),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: ColorManager.primary,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}
