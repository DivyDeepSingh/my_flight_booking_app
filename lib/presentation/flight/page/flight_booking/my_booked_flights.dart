import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flight_booking_app/presentation/flight/bloc/flight_bloc.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';
import 'package:my_flight_booking_app/presentation/flight/page/flight_booking/widget/flight_details_widget.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class MyBookedFlightsScreen extends StatelessWidget {
  const MyBookedFlightsScreen({super.key});

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
          "My Flights",
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: BlocConsumer<FlightBloc, FlightState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isLoading) {
            // Show a loading indicator if the state is still loading
            return Center(child: CircularProgressIndicator());
          }

          if (state.myBookedFlights == null || state.myBookedFlights!.isEmpty) {
            // If no booked flights, display a message
            return Center(
              child: Text(
                'No flights booked yet.',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading for "Your Flight Details"
                Text(
                  'Your Flight Details',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary,
                  ),
                ),
                SizedBox(height: 16.h),

                // Wrapping ListView.builder in Expanded for proper scrolling
                Expanded(
                  child: ListView.builder(
                    itemCount: state.myBookedFlights!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: FlightDetailsWidget(
                          flight: state.myBookedFlights![index],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
