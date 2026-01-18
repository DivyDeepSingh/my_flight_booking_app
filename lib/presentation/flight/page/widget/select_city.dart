import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flight_booking_app/models/flight/cities_model.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class SelectCity extends StatelessWidget {
  final List<CityModel> cities;
  final Function(CityModel city) OnTap;
  const SelectCity({super.key, required this.cities, required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: ColorManager.black.withOpacity(0.08), blurRadius: 8),
        ],
      ),
      constraints: const BoxConstraints(maxHeight: 220),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: cities.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final city = cities![index];

          return ListTile(
            leading: Icon(Icons.location_city, size: 18.sp),
            title: Text(city.name, style: TextStyle(fontSize: 14.sp)),
            subtitle: Text(city.state, style: TextStyle(fontSize: 12.sp)),
            onTap: () => OnTap(city),
          );
        },
      ),
    );
  }
}
