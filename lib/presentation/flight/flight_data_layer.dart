import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/core/error/failure_handler.dart';
import 'package:my_flight_booking_app/models/flight/cities_model.dart';
import 'package:my_flight_booking_app/presentation/flight/flight_repository.dart';
import '../../models/flight/flight_model.dart';

class FlightDataLayer {
  final FlightRepository _flightRepository;

  FlightDataLayer({FlightRepository? flightRepository})
    : _flightRepository = flightRepository ?? FlightRepository();

  Future<Either<ApiFailure, List<CityModel>>> searchCities(String query) async {
    try {
      final filtered = _flightRepository.searchCities(query);

      List<CityModel> _cities = List.generate(
        filtered.length,
        (index) => CityModel.fromJson(filtered[index]),
      );
      return Right(_cities);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }

  Future<Either<ApiFailure, List<FlightModel>>> searchFlights({
    required String from,
    required String to,
    required DateTime date,
  }) async {
    try {
      final response = await _flightRepository.searchFlights(
        from: from,
        to: to,
        date: DateFormat('yyyy-MM-dd').format(date),
      );

      final flights = response
          .map((json) => FlightModel.fromJson(json))
          .toList();

      return Right(flights);
    } catch (error) {
      final failure = FailureHandler.handleFailure(error);
      return Left(failure);
    }
  }
}
