part of 'flight_bloc.dart';

abstract class FlightEvent {
  const FlightEvent();
}

class InitialFlightEvent extends FlightEvent {}

class FromCitySearchEvent extends FlightEvent {
  final String query;
  FromCitySearchEvent({required this.query});
}

class ToCitySearchEvent extends FlightEvent {
  final String query;
  ToCitySearchEvent({required this.query});
}

class FromCitySelectedEvent extends FlightEvent {
  final CityModel selectedCity;
  FromCitySelectedEvent({required this.selectedCity});
}

class ToCitySelectedEvent extends FlightEvent {
  final CityModel selectedCity;
  ToCitySelectedEvent({required this.selectedCity});
}

class SearchFlightsEvent extends FlightEvent {
  final String fromCity;
  final String toCity;
  final DateTime date;

  SearchFlightsEvent({
    required this.fromCity,
    required this.toCity,
    required this.date,
  });
}

class SelectDateEvent extends FlightEvent {
  final DateTime date;
  SelectDateEvent(this.date);
}
