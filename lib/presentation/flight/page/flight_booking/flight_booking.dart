import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flight_booking_app/presentation/flight/bloc/flight_bloc.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';
import 'package:my_flight_booking_app/presentation/flight/page/flight_booking/my_booked_flights.dart';
import 'package:my_flight_booking_app/presentation/flight/page/flight_booking/widget/flight_details_widget.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class FlightBookingScreen extends StatelessWidget {
  final FlightModel flight; // Flight details passed to this screen

  const FlightBookingScreen({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Book Flight",
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: BlocConsumer<FlightBloc, FlightState>(
        listener: (context, state) {
          if (state.isBookingSuccessful) {
            // After successful booking, show success message and navigate back
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Flight Booked Successfully!')),
            );

            BlocProvider.of<FlightBloc>(context).add(MyBookedFlightsEvent());

            Navigator.popUntil(context, (route) => route.isFirst);

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyBookedFlightsScreen()),
            );
          } else if (state.bookingError != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.bookingError!)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flight Details',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
                SizedBox(height: 16.h),

                FlightDetailsWidget(flight: flight),

                SizedBox(height: 24.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      backgroundColor: ColorManager.primary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    onPressed: () {
                      BlocProvider.of<FlightBloc>(
                        context,
                      ).add(BookFlightEvent(flight: flight));
                    },
                    icon: Icon(
                      Icons.flight_takeoff,
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Book Flight',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
