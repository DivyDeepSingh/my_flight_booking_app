import 'package:hive/hive.dart';

part 'flight_model.g.dart'; // This is for code generation

@HiveType(typeId: 1)
class FlightModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String from;
  @HiveField(2)
  final String to;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String airline;
  @HiveField(5)
  final double price;

  FlightModel({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.airline,
    required this.price,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) {
    return FlightModel(
      id: json['id'] ?? '',
      from: json['from'] ?? '',
      to: json['to'] ?? '',
      date: json['date'] ?? '',
      airline: json['airline'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
