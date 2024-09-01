import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String? imageUrl;
  final bool isOnline;
  final String lastSeen;

  UserModel(
      {required this.username,
      required this.email,
      this.imageUrl,
      required this.isOnline,
      required this.lastSeen});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
        username: data['username'],
        email: data['email'],
        isOnline: data['is_online'],
        lastSeen: data['last_seen']);
  }
}
