class FlightModel {
  final String id;
  final String from;
  final String to;
  final String date;
  final String airline;
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
