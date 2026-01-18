part of 'flight_bloc.dart';

@freezed
class FlightState with _$FlightState {
  factory FlightState({
    required bool isLoading, // Loading indicator
    List<CityModel>? allCities, // All cities from the repository
    List<CityModel>?
    filteredFromCities, // Filtered cities for "From" autocomplete
    List<CityModel>? filteredToCities, // Filtered cities for "To" autocomplete
    CityModel?
    selectedFromCity, // Selected "From" city (CityModel for more details)
    CityModel?
    selectedToCity, // Selected "To" city (CityModel for more details)
    DateTime? selectedDate, // Selected date for flight search
    List<FlightModel>? searchResults, // Flight search results
    String? fromCityError, // Error message for "From" city search
    String? toCityError, // Error message for "To" city search
    String? searchError, // General error message for search
  }) = _FlightState;

  factory FlightState.initial() => FlightState(
    isLoading: false,
    allCities: [],
    filteredFromCities: [],
    filteredToCities: [],
    selectedFromCity: null,
    selectedToCity: null,
    selectedDate: null,
    searchResults: null,
    fromCityError: null,
    toCityError: null,
    searchError: null,
  );
}
