import 'package:cloud_firestore/cloud_firestore.dart';

class ChatGroupRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createGroup({
    required String name,
    required String ownerId,
    required List<String> members,
  }) async {
    final docRef = await _firestore.collection('chat_groups').add({
      'name': name,
      'ownerId': ownerId,
      'members': members,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return docRef.id;
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final snapshot = await _firestore.collection('users').get();

    return snapshot.docs.map((doc) {
      return {'id': doc.id, ...doc.data()};
    }).toList();
  }

  Stream<List<Map<String, dynamic>>> getUserGroups(String userId) {
    return _firestore
        .collection('chat_groups')
        .where('members', arrayContains: userId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return {'id': doc.id, ...doc.data()};
          }).toList();
        });
  }

  Future<String> sendMessage({
    required String groupId,
    required String senderId,
    required String message,

    required String senderName,
  }) async {
    final docRef = await _firestore
        .collection('chat_groups')
        .doc(groupId)
        .collection('messages')
        .add({
          'senderId': senderId,
          'message': message,

          'senderName': senderName,
          'createdAt': FieldValue.serverTimestamp(),
        });

    return docRef.id;
  }

  Stream<List<Map<String, dynamic>>> getGroupMessages(String groupId) {
    return _firestore
        .collection('chat_groups')
        .doc(groupId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return {
              'id': doc.id,
              'message': data['message'] ?? '',
              'senderId': data['senderId'] ?? '',
              'senderName': data['senderName'] ?? '',
              'createdAt': data['createdAt'],
            };
          }).toList();
        });
  }

  Future<String> getUserNameById(String userId) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (!doc.exists) return '';

    return doc.data()?['name'] ?? '';
  }

  Future<bool> leaveGroup({
    required String groupId,
    required String userId,
  }) async {
    await _firestore.collection('chat_groups').doc(groupId).update({
      'members': FieldValue.arrayRemove([userId]),
    });

    return true;
  }
}
