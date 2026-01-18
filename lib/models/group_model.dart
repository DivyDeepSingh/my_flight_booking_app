import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String? id;
  final String? name;

  final String? ownerId;
  final String? createdBy;
  final List<String> members;
  final DateTime? createdAt;

  GroupModel({
    this.id = '',
    this.name = '',
    this.createdBy = '',

    this.ownerId = '',
    this.members = const [],
    this.createdAt,
  });

  // JSON Serialization
  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',

      ownerId: json['ownerId'] ?? '',
      createdBy: json['createdBy'] ?? '',
      members: json['members'] != null
          ? List<String>.from(json['members'])
          : [],

      createdAt: json['createdAt'] is Timestamp
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(), // Convert Firestore Timestamp to DateTime
    );
  }

  // JSON Deserialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdBy': createdBy,
      'members': members,

      'ownerId': ownerId,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
