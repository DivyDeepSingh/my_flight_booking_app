import 'package:hive/hive.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';

class FlightStorageHelper {
  Future<Box<FlightModel>> openFlightBox() async {
    return await Hive.openBox<FlightModel>('flight_bookings');
  }

  Future<void> saveFlight(FlightModel flight) async {
    var box = await openFlightBox();
    await box.put(flight.id, flight); // Flight ID will be the key
  }

  Future<List<FlightModel>> getAllFlights() async {
    var box = await openFlightBox();
    final flights = box.values.toList();
    return flights;
  }

  Future<FlightModel?> getFlightById(String flightId) async {
    var box = await openFlightBox();
    return box.get(flightId); // Get by flight ID
  }

  Future<void> deleteFlight(String flightId) async {
    var box = await openFlightBox();
    await box.delete(flightId); // Delete flight by its ID
  }

  Future<void> clearAllFlights() async {
    var box = await openFlightBox();
    await box.clear(); // Remove all data in the box
  }
}
