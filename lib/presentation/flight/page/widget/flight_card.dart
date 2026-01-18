import 'package:flutter/material.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class FlightCard extends StatelessWidget {
  final FlightModel flight;
  const FlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Airline info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                flight.airline,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "${flight.from} → ${flight.to}",
                style: TextStyle(fontSize: 14, color: ColorManager.grey),
              ),
              SizedBox(height: 4),
              Text(
                flight.date,
                style: TextStyle(fontSize: 14, color: ColorManager.grey),
              ),
            ],
          ),

          Text(
            "${flight.price.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
