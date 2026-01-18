import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_flight_booking_app/models/flight/cities_model.dart';
import 'package:my_flight_booking_app/presentation/auth/widget/input_textfield.dart';
import 'package:my_flight_booking_app/presentation/flight/bloc/flight_bloc.dart';
import 'package:my_flight_booking_app/presentation/flight/flight_data_layer.dart';
import 'package:my_flight_booking_app/presentation/flight/page/widget/flight_card.dart';
import 'package:my_flight_booking_app/presentation/flight/page/widget/select_city.dart';
import 'package:my_flight_booking_app/use_case/common_functions.dart';
import 'package:my_flight_booking_app/utils/color_manager.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FlightBloc, FlightState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.primary.withOpacity(0.9),
                  ColorManager.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorManager.white,
                            size: 26.sp,
                          ),

                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'FlyEasy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // ===== Expanded scrollable content =====
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // ===== Flight Search Inputs =====
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.black.withOpacity(0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  // From city
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputTextfield(
                                        controller: _fromController,
                                        icon: Icons.flight_takeoff,
                                        label: 'From',
                                        onChange: (value) {
                                          BlocProvider.of<FlightBloc>(
                                            context,
                                          ).add(
                                            FromCitySearchEvent(query: value),
                                          );
                                        },
                                      ),
                                      if (state.filteredFromCities != null &&
                                          state.filteredFromCities!.isNotEmpty)
                                        SelectCity(
                                          cities: state.filteredFromCities!,
                                          OnTap: (CityModel value) {
                                            _fromController.text = value.name;
                                            BlocProvider.of<FlightBloc>(
                                              context,
                                            ).add(
                                              FromCitySelectedEvent(
                                                selectedCity: value,
                                              ),
                                            );
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  // To city
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InputTextfield(
                                        controller: _toController,
                                        icon: Icons.flight_land,
                                        label: 'To',
                                        onChange: (value) {
                                          BlocProvider.of<FlightBloc>(
                                            context,
                                          ).add(
                                            ToCitySearchEvent(query: value),
                                          );
                                        },
                                      ),
                                      if (state.filteredToCities != null &&
                                          state.filteredToCities!.isNotEmpty)
                                        SelectCity(
                                          cities: state.filteredToCities!,
                                          OnTap: (CityModel value) {
                                            _toController.text = value.name;
                                            BlocProvider.of<FlightBloc>(
                                              context,
                                            ).add(
                                              ToCitySelectedEvent(
                                                selectedCity: value,
                                              ),
                                            );
                                            FocusScope.of(context).unfocus();
                                          },
                                        ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  // Date Picker
                                  InkWell(
                                    onTap: () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            state.selectedDate ??
                                            DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 365),
                                        ),
                                      );
                                      if (date != null) {
                                        BlocProvider.of<FlightBloc>(
                                          context,
                                        ).add(SelectDateEvent(date));
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        border: Border.all(
                                          color: ColorManager.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: ColorManager.primary,
                                          ),
                                          SizedBox(width: 14.w),
                                          Text(
                                            state.selectedDate != null
                                                ? DateFormat(
                                                    'dd MMM yyyy',
                                                  ).format(state.selectedDate!)
                                                : 'Select Date',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  // Search Flights Button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        backgroundColor: ColorManager.primary,
                                      ),
                                      onPressed: () {
                                        final state = context
                                            .read<FlightBloc>()
                                            .state;

                                        if (_fromController.text
                                                .trim()
                                                .isEmpty ||
                                            state.selectedFromCity == null) {
                                          showError(
                                            context,
                                            'Please select source city',
                                          );
                                          return;
                                        }

                                        if (_toController.text.trim().isEmpty ||
                                            state.selectedToCity == null) {
                                          showError(
                                            context,
                                            'Please select destination city',
                                          );
                                          return;
                                        }

                                        if (state.selectedFromCity!.name ==
                                            state.selectedToCity!.name) {
                                          showError(
                                            context,
                                            'Source and destination cannot be same',
                                          );
                                          return;
                                        }

                                        if (state.selectedDate == null) {
                                          showError(
                                            context,
                                            'Please select travel date',
                                          );
                                          return;
                                        }

                                        BlocProvider.of<FlightBloc>(
                                          context,
                                        ).add(
                                          SearchFlightsEvent(
                                            fromCity:
                                                state.selectedFromCity!.name,
                                            toCity: state.selectedToCity!.name,
                                            date: state.selectedDate!,
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        size: 18.sp,
                                        color: ColorManager.white,
                                      ),
                                      label: Text(
                                        'Search Flights',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 24.h),

                            // ===== Search Results =====
                            if (state.isLoading)
                              Center(child: CircularProgressIndicator()),

                            if (state.searchError != null)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  state.searchError!,
                                  style: TextStyle(color: ColorManager.error),
                                ),
                              ),

                            // Check if searchResults is empty
                            if (state.searchResults != null &&
                                state.searchResults!.isNotEmpty)
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.searchResults!.length,
                                itemBuilder: (context, index) {
                                  final flight = state.searchResults![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: FlightCard(flight: flight),
                                  );
                                },
                              )
                            else if (state.searchResults != null &&
                                state.searchResults!.isEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.flight_takeoff,
                                      size: 80,
                                      color: ColorManager.grey,
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      "No flights found for this route",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
