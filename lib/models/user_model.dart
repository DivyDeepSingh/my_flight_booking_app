class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
  });

  // Convert JSON to UserModel object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }

  // Convert UserModel object to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'phoneNumber': phoneNumber};
  }
}
