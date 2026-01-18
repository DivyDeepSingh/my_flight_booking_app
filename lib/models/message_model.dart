import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel {
  @HiveField(0)
  final String groupId;

  @HiveField(1)
  final String senderId;

  @HiveField(2)
  final String message;

  // Always store as ISO String (Hive friendly)
  @HiveField(3)
  final String createdAt;

  @HiveField(4, defaultValue: '')
  final String senderName;

  MessageModel({
    required this.groupId,
    required this.senderId,
    required this.message,
    required this.createdAt,
    required this.senderName,
  });

  /// ✅ Firestore → App → Hive safe
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final createdAtRaw = json['createdAt'];

    return MessageModel(
      groupId: json['groupId'] ?? '',
      senderId: json['senderId'] ?? '',
      message: json['message'] ?? '',
      senderName: json['senderName'] ?? '',

      // 🔥 Timestamp handling
      createdAt: createdAtRaw is Timestamp
          ? createdAtRaw.toDate().toIso8601String()
          : (createdAtRaw?.toString() ?? ''),
    );
  }

  /// ✅ App → Firestore / Hive
  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'senderId': senderId,
      'message': message,
      'senderName': senderName,
      'createdAt': createdAt,
    };
  }

  String get formattedDateTime {
    if (createdAt.isEmpty) return '';
    final date = DateTime.tryParse(createdAt);
    if (date == null) return '';

    final formattedDate = DateFormat(
      'MMM dd, yyyy',
    ).format(date); // Jan 18, 2026
    final formattedTime = DateFormat('h:mm a').format(date); // 5:30 PM
    return '$formattedDate • $formattedTime';
  }
}
