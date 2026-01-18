import 'package:my_flight_booking_app/data/flight_dummy_data.dart';

class FlightRepository {
  Future<List<Map<String, dynamic>>> searchFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    return flightDummyData.where((flight) {
      return flight['from'].toString().toLowerCase() == from.toLowerCase() &&
          flight['to'].toString().toLowerCase() == to.toLowerCase() &&
          flight['date'] == date;
    }).toList();
  }

  List<Map<String, dynamic>> searchCities(String query) {
    return citiesDummy
        .where(
          (city) => (city['name'] as String).toLowerCase().contains(
            query.toLowerCase(),
          ),
        )
        .toList();
  }
}
