import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flight_booking_app/models/message_model.dart';

class MessageStorageHelper {
  static final MessageStorageHelper _instance =
      MessageStorageHelper._internal();

  factory MessageStorageHelper() => _instance;

  MessageStorageHelper._internal();

  Future<void> openBox() async {
    await Hive.openBox<MessageModel>('messagesBox');
  }

  Future<void> insertMessage(MessageModel message) async {
    final box = await Hive.openBox<MessageModel>('messagesBox');
    await box.add(message);
  }

  Future<void> clearAllMessgaes() async {
    final box = await Hive.openBox<MessageModel>('messagesBox');
    await box.clear();
  }

  Future<List<MessageModel>> getMessagesByGroupId(String groupId) async {
    final box = await Hive.openBox<MessageModel>('messagesBox');
    return box.values.where((msg) => msg.groupId == groupId).toList();
  }

  Future<void> clearMessagesByGroupId(String groupId) async {
    final box = await Hive.openBox<MessageModel>('messagesBox');

    for (int i = 0; i < box.length; i++) {
      final message = box.getAt(i);

      if (message != null && message.groupId == groupId) {
        await box.deleteAt(i);
      }
    }
  }
}
