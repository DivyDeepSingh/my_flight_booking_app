import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flight_booking_app/core/error/api_failures.dart';
import 'package:my_flight_booking_app/models/flight/cities_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_flight_booking_app/models/flight/flight_model.dart';
import 'package:my_flight_booking_app/presentation/flight/flight_data_layer.dart';

part 'flight_bloc.freezed.dart';
part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightDataLayer dataLayer;

  FlightBloc({required this.dataLayer}) : super(FlightState.initial()) {
    on<InitialFlightEvent>((event, emit) {
      emit(FlightState.initial());
    });

    on<FromCitySearchEvent>((event, emit) async {
      if (state.selectedFromCity != null &&
          event.query == state.selectedFromCity!.name) {
        return;
      }

      if (event.query.isEmpty) {
        emit(state.copyWith(filteredFromCities: [], selectedFromCity: null));
        return;
      }

      final result = await dataLayer.searchCities(event.query);

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              fromCityError: failure.failureMessage,
              filteredFromCities: [],
            ),
          );
        },
        (cities) {
          emit(
            state.copyWith(
              fromCityError: null,
              filteredFromCities: cities,
              selectedFromCity: null,
            ),
          );
        },
      );
    });

    on<ToCitySearchEvent>((event, emit) async {
      if (state.selectedToCity != null &&
          event.query == state.selectedToCity!.name) {
        return;
      }

      if (event.query.isEmpty) {
        emit(state.copyWith(filteredToCities: [], selectedToCity: null));
        return;
      }

      final result = await dataLayer.searchCities(event.query);

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              toCityError: failure.failureMessage,
              filteredToCities: [],
            ),
          );
        },
        (cities) {
          emit(
            state.copyWith(
              toCityError: null,
              filteredToCities: cities,
              selectedToCity: null,
            ),
          );
        },
      );
    });

    on<FromCitySelectedEvent>((event, emit) {
      emit(
        state.copyWith(
          selectedFromCity: event.selectedCity,
          filteredFromCities: [],
        ),
      );
    });

    on<ToCitySelectedEvent>((event, emit) {
      emit(
        state.copyWith(
          selectedToCity: event.selectedCity,
          filteredToCities: [],
        ),
      );
    });

    on<SelectDateEvent>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });

    on<SearchFlightsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, searchError: null));

      final Either<ApiFailure, List<FlightModel>> result = await dataLayer
          .searchFlights(
            from: event.fromCity,
            to: event.toCity,
            date: event.date,
          );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              searchError: failure.failureMessage,
              searchResults: [],
            ),
          );
        },
        (flights) {
          emit(
            state.copyWith(
              isLoading: false,
              searchResults: flights,
              searchError: null,
            ),
          );
        },
      );
    });
  }
}
