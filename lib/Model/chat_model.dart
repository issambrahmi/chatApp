import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final List usersNames;
  final List usersId;
  final List usersImages;
  final String lastMessage;
  final Timestamp lastMessageDate;
  final String firstUserId;

  ChatModel({
    required this.usersImages,
    required this.usersNames,
    required this.usersId,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.firstUserId,
  });

  factory ChatModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ChatModel(
        usersNames: data['users_names'],
        usersId: data['users_id'],
        lastMessage: data['last_message'],
        lastMessageDate: data['last_message_date'],
        firstUserId: data['first_user_id'],
        usersImages: data['users_images']);
  }

  Map<String, dynamic> toMap() {
    return {
      'users_names': usersNames,
      'users_id': usersId,
      'last_message': lastMessage,
      'last_message_date': lastMessageDate,
      'first_user_id': firstUserId,
      'users_images' : usersImages
    };
  }
}
