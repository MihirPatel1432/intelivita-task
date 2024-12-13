import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  final String senderId;
  final String message;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.message,
    required this.timestamp,
  });

  factory ChatMessage.fromDocumentSnapshot(DocumentSnapshot doc) {
    return ChatMessage(
      senderId: doc['senderId'],
      message: doc['message'],
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    );
  }
}