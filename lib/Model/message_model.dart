import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String recieverId;
  final Timestamp date;
  final String? text;
  final bool read;
  final String? imageUrl;

  MessageModel(
      {required this.senderId,
      required this.recieverId,
      required this.date,
      this.text,
      required this.read,
      this.imageUrl});

  factory MessageModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MessageModel(
        senderId: data['sender_id'],
        recieverId: data['reciever_id'],
        date: data['date'],
        read: data['read'],
        text: data['text'],
        imageUrl: data['image_url']);
  }

  Map<String, dynamic> toMap() {
    return {
      'sender_id': senderId,
      'reciever_id': recieverId,
      'date': date,
      'read': read,
      'text': text,
      'image_url': imageUrl
    };
  }
}
