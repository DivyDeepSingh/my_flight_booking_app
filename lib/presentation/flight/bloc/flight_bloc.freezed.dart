// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlightState {
  bool get isLoading => throw _privateConstructorUsedError; // Loading indicator
  List<CityModel>? get allCities =>
      throw _privateConstructorUsedError; // All cities from the repository
  List<CityModel>? get filteredFromCities =>
      throw _privateConstructorUsedError; // Filtered cities for "From" autocomplete
  List<CityModel>? get filteredToCities =>
      throw _privateConstructorUsedError; // Filtered cities for "To" autocomplete
  CityModel? get selectedFromCity =>
      throw _privateConstructorUsedError; // Selected "From" city (CityModel for more details)
  CityModel? get selectedToCity =>
      throw _privateConstructorUsedError; // Selected "To" city (CityModel for more details)
  DateTime? get selectedDate =>
      throw _privateConstructorUsedError; // Selected date for flight search
  List<FlightModel>? get searchResults =>
      throw _privateConstructorUsedError; // Flight search results
  List<FlightModel>? get myBookedFlights =>
      throw _privateConstructorUsedError; // Flight search results
  bool get isBookingSuccessful => throw _privateConstructorUsedError;
  String? get fromCityError => throw _privateConstructorUsedError;
  String? get toCityError => throw _privateConstructorUsedError;
  String? get searchError => throw _privateConstructorUsedError;
  String? get bookingError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FlightStateCopyWith<FlightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightStateCopyWith<$Res> {
  factory $FlightStateCopyWith(
          FlightState value, $Res Function(FlightState) then) =
      _$FlightStateCopyWithImpl<$Res, FlightState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CityModel>? allCities,
      List<CityModel>? filteredFromCities,
      List<CityModel>? filteredToCities,
      CityModel? selectedFromCity,
      CityModel? selectedToCity,
      DateTime? selectedDate,
      List<FlightModel>? searchResults,
      List<FlightModel>? myBookedFlights,
      bool isBookingSuccessful,
      String? fromCityError,
      String? toCityError,
      String? searchError,
      String? bookingError});
}

/// @nodoc
class _$FlightStateCopyWithImpl<$Res, $Val extends FlightState>
    implements $FlightStateCopyWith<$Res> {
  _$FlightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allCities = freezed,
    Object? filteredFromCities = freezed,
    Object? filteredToCities = freezed,
    Object? selectedFromCity = freezed,
    Object? selectedToCity = freezed,
    Object? selectedDate = freezed,
    Object? searchResults = freezed,
    Object? myBookedFlights = freezed,
    Object? isBookingSuccessful = null,
    Object? fromCityError = freezed,
    Object? toCityError = freezed,
    Object? searchError = freezed,
    Object? bookingError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allCities: freezed == allCities
          ? _value.allCities
          : allCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      filteredFromCities: freezed == filteredFromCities
          ? _value.filteredFromCities
          : filteredFromCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      filteredToCities: freezed == filteredToCities
          ? _value.filteredToCities
          : filteredToCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      selectedFromCity: freezed == selectedFromCity
          ? _value.selectedFromCity
          : selectedFromCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedToCity: freezed == selectedToCity
          ? _value.selectedToCity
          : selectedToCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchResults: freezed == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<FlightModel>?,
      myBookedFlights: freezed == myBookedFlights
          ? _value.myBookedFlights
          : myBookedFlights // ignore: cast_nullable_to_non_nullable
              as List<FlightModel>?,
      isBookingSuccessful: null == isBookingSuccessful
          ? _value.isBookingSuccessful
          : isBookingSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      fromCityError: freezed == fromCityError
          ? _value.fromCityError
          : fromCityError // ignore: cast_nullable_to_non_nullable
              as String?,
      toCityError: freezed == toCityError
          ? _value.toCityError
          : toCityError // ignore: cast_nullable_to_non_nullable
              as String?,
      searchError: freezed == searchError
          ? _value.searchError
          : searchError // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingError: freezed == bookingError
          ? _value.bookingError
          : bookingError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightStateImplCopyWith<$Res>
    implements $FlightStateCopyWith<$Res> {
  factory _$$FlightStateImplCopyWith(
          _$FlightStateImpl value, $Res Function(_$FlightStateImpl) then) =
      __$$FlightStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CityModel>? allCities,
      List<CityModel>? filteredFromCities,
      List<CityModel>? filteredToCities,
      CityModel? selectedFromCity,
      CityModel? selectedToCity,
      DateTime? selectedDate,
      List<FlightModel>? searchResults,
      List<FlightModel>? myBookedFlights,
      bool isBookingSuccessful,
      String? fromCityError,
      String? toCityError,
      String? searchError,
      String? bookingError});
}

/// @nodoc
class __$$FlightStateImplCopyWithImpl<$Res>
    extends _$FlightStateCopyWithImpl<$Res, _$FlightStateImpl>
    implements _$$FlightStateImplCopyWith<$Res> {
  __$$FlightStateImplCopyWithImpl(
      _$FlightStateImpl _value, $Res Function(_$FlightStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allCities = freezed,
    Object? filteredFromCities = freezed,
    Object? filteredToCities = freezed,
    Object? selectedFromCity = freezed,
    Object? selectedToCity = freezed,
    Object? selectedDate = freezed,
    Object? searchResults = freezed,
    Object? myBookedFlights = freezed,
    Object? isBookingSuccessful = null,
    Object? fromCityError = freezed,
    Object? toCityError = freezed,
    Object? searchError = freezed,
    Object? bookingError = freezed,
  }) {
    return _then(_$FlightStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allCities: freezed == allCities
          ? _value._allCities
          : allCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      filteredFromCities: freezed == filteredFromCities
          ? _value._filteredFromCities
          : filteredFromCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      filteredToCities: freezed == filteredToCities
          ? _value._filteredToCities
          : filteredToCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      selectedFromCity: freezed == selectedFromCity
          ? _value.selectedFromCity
          : selectedFromCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedToCity: freezed == selectedToCity
          ? _value.selectedToCity
          : selectedToCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchResults: freezed == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<FlightModel>?,
      myBookedFlights: freezed == myBookedFlights
          ? _value._myBookedFlights
          : myBookedFlights // ignore: cast_nullable_to_non_nullable
              as List<FlightModel>?,
      isBookingSuccessful: null == isBookingSuccessful
          ? _value.isBookingSuccessful
          : isBookingSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      fromCityError: freezed == fromCityError
          ? _value.fromCityError
          : fromCityError // ignore: cast_nullable_to_non_nullable
              as String?,
      toCityError: freezed == toCityError
          ? _value.toCityError
          : toCityError // ignore: cast_nullable_to_non_nullable
              as String?,
      searchError: freezed == searchError
          ? _value.searchError
          : searchError // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingError: freezed == bookingError
          ? _value.bookingError
          : bookingError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FlightStateImpl implements _FlightState {
  _$FlightStateImpl(
      {required this.isLoading,
      final List<CityModel>? allCities,
      final List<CityModel>? filteredFromCities,
      final List<CityModel>? filteredToCities,
      this.selectedFromCity,
      this.selectedToCity,
      this.selectedDate,
      final List<FlightModel>? searchResults,
      final List<FlightModel>? myBookedFlights,
      required this.isBookingSuccessful,
      this.fromCityError,
      this.toCityError,
      this.searchError,
      this.bookingError})
      : _allCities = allCities,
        _filteredFromCities = filteredFromCities,
        _filteredToCities = filteredToCities,
        _searchResults = searchResults,
        _myBookedFlights = myBookedFlights;

  @override
  final bool isLoading;
// Loading indicator
  final List<CityModel>? _allCities;
// Loading indicator
  @override
  List<CityModel>? get allCities {
    final value = _allCities;
    if (value == null) return null;
    if (_allCities is EqualUnmodifiableListView) return _allCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// All cities from the repository
  final List<CityModel>? _filteredFromCities;
// All cities from the repository
  @override
  List<CityModel>? get filteredFromCities {
    final value = _filteredFromCities;
    if (value == null) return null;
    if (_filteredFromCities is EqualUnmodifiableListView)
      return _filteredFromCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Filtered cities for "From" autocomplete
  final List<CityModel>? _filteredToCities;
// Filtered cities for "From" autocomplete
  @override
  List<CityModel>? get filteredToCities {
    final value = _filteredToCities;
    if (value == null) return null;
    if (_filteredToCities is EqualUnmodifiableListView)
      return _filteredToCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Filtered cities for "To" autocomplete
  @override
  final CityModel? selectedFromCity;
// Selected "From" city (CityModel for more details)
  @override
  final CityModel? selectedToCity;
// Selected "To" city (CityModel for more details)
  @override
  final DateTime? selectedDate;
// Selected date for flight search
  final List<FlightModel>? _searchResults;
// Selected date for flight search
  @override
  List<FlightModel>? get searchResults {
    final value = _searchResults;
    if (value == null) return null;
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Flight search results
  final List<FlightModel>? _myBookedFlights;
// Flight search results
  @override
  List<FlightModel>? get myBookedFlights {
    final value = _myBookedFlights;
    if (value == null) return null;
    if (_myBookedFlights is EqualUnmodifiableListView) return _myBookedFlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Flight search results
  @override
  final bool isBookingSuccessful;
  @override
  final String? fromCityError;
  @override
  final String? toCityError;
  @override
  final String? searchError;
  @override
  final String? bookingError;

  @override
  String toString() {
    return 'FlightState(isLoading: $isLoading, allCities: $allCities, filteredFromCities: $filteredFromCities, filteredToCities: $filteredToCities, selectedFromCity: $selectedFromCity, selectedToCity: $selectedToCity, selectedDate: $selectedDate, searchResults: $searchResults, myBookedFlights: $myBookedFlights, isBookingSuccessful: $isBookingSuccessful, fromCityError: $fromCityError, toCityError: $toCityError, searchError: $searchError, bookingError: $bookingError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._allCities, _allCities) &&
            const DeepCollectionEquality()
                .equals(other._filteredFromCities, _filteredFromCities) &&
            const DeepCollectionEquality()
                .equals(other._filteredToCities, _filteredToCities) &&
            (identical(other.selectedFromCity, selectedFromCity) ||
                other.selectedFromCity == selectedFromCity) &&
            (identical(other.selectedToCity, selectedToCity) ||
                other.selectedToCity == selectedToCity) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            const DeepCollectionEquality()
                .equals(other._myBookedFlights, _myBookedFlights) &&
            (identical(other.isBookingSuccessful, isBookingSuccessful) ||
                other.isBookingSuccessful == isBookingSuccessful) &&
            (identical(other.fromCityError, fromCityError) ||
                other.fromCityError == fromCityError) &&
            (identical(other.toCityError, toCityError) ||
                other.toCityError == toCityError) &&
            (identical(other.searchError, searchError) ||
                other.searchError == searchError) &&
            (identical(other.bookingError, bookingError) ||
                other.bookingError == bookingError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_allCities),
      const DeepCollectionEquality().hash(_filteredFromCities),
      const DeepCollectionEquality().hash(_filteredToCities),
      selectedFromCity,
      selectedToCity,
      selectedDate,
      const DeepCollectionEquality().hash(_searchResults),
      const DeepCollectionEquality().hash(_myBookedFlights),
      isBookingSuccessful,
      fromCityError,
      toCityError,
      searchError,
      bookingError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightStateImplCopyWith<_$FlightStateImpl> get copyWith =>
      __$$FlightStateImplCopyWithImpl<_$FlightStateImpl>(this, _$identity);
}

abstract class _FlightState implements FlightState {
  factory _FlightState(
      {required final bool isLoading,
      final List<CityModel>? allCities,
      final List<CityModel>? filteredFromCities,
      final List<CityModel>? filteredToCities,
      final CityModel? selectedFromCity,
      final CityModel? selectedToCity,
      final DateTime? selectedDate,
      final List<FlightModel>? searchResults,
      final List<FlightModel>? myBookedFlights,
      required final bool isBookingSuccessful,
      final String? fromCityError,
      final String? toCityError,
      final String? searchError,
      final String? bookingError}) = _$FlightStateImpl;

  @override
  bool get isLoading;
  @override // Loading indicator
  List<CityModel>? get allCities;
  @override // All cities from the repository
  List<CityModel>? get filteredFromCities;
  @override // Filtered cities for "From" autocomplete
  List<CityModel>? get filteredToCities;
  @override // Filtered cities for "To" autocomplete
  CityModel? get selectedFromCity;
  @override // Selected "From" city (CityModel for more details)
  CityModel? get selectedToCity;
  @override // Selected "To" city (CityModel for more details)
  DateTime? get selectedDate;
  @override // Selected date for flight search
  List<FlightModel>? get searchResults;
  @override // Flight search results
  List<FlightModel>? get myBookedFlights;
  @override // Flight search results
  bool get isBookingSuccessful;
  @override
  String? get fromCityError;
  @override
  String? get toCityError;
  @override
  String? get searchError;
  @override
  String? get bookingError;
  @override
  @JsonKey(ignore: true)
  _$$FlightStateImplCopyWith<_$FlightStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
