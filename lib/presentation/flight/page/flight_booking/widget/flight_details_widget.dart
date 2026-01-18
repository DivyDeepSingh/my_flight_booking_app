import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class FlightDetailsWidget extends StatelessWidget {
  final FlightModel flight;
  const FlightDetailsWidget({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: ColorManager.white, // Card background color
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Airline
            Text(
              'Airline: ${flight.airline}',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),
            SizedBox(height: 8.h),

            // Flight Route (From and To)
            Row(
              children: [
                Icon(Icons.flight_takeoff, color: ColorManager.primary),
                SizedBox(width: 8.w),
                Text(
                  'From: ${flight.from}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 16.w),
                Icon(Icons.flight_land, color: ColorManager.primary),
                SizedBox(width: 8.w),
                Text(
                  'To: ${flight.to}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Flight Date
            Row(
              children: [
                Icon(Icons.calendar_today, color: ColorManager.primary),
                SizedBox(width: 8.w),
                Text(
                  'Date: ${flight.date}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Flight Price
            Row(
              children: [
                Icon(Icons.currency_rupee, color: ColorManager.primary),
                SizedBox(width: 8.w),
                Text(
                  'Price: ${flight.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
