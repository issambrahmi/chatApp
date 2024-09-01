import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final List<String> usersNames;
  final List<String> usersId;
  final String lastMessage;
  final Timestamp lastMessageDate;

  ChatModel(
      {required this.usersNames,
      required this.usersId,
      required this.lastMessage,
      required this.lastMessageDate});

  factory ChatModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatModel(
        usersNames: data['users_names'],
        usersId: data['users_id'],
        lastMessage: data['last_message'],
        lastMessageDate: data['last_message_date']);
  }

  Map<String, dynamic> toMap() {
    return {
      'users_names': usersNames,
      'users_id': usersId,
      'last_message': lastMessage,
      'last_message_date': lastMessageDate
    };
  }
}
