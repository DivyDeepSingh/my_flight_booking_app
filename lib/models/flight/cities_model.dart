class CityModel {
  final String id; // unique id, e.g., "DEL"
  final String name; // city name, e.g., "Delhi"
  final String state; // state name, e.g., "Delhi"
  final String country; // country name, e.g., "India"

  CityModel({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'state': state, 'country': country};
  }

  @override
  String toString() => '$name, $state';
}
