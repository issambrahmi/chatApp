import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String? password;
  final String? imageUrl;
  final bool isOnline;
  final String lastSeen;

  UserModel({
    required this.username,
    required this.email,
    this.password,
    this.imageUrl,
    required this.isOnline,
    required this.lastSeen,
  });

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
        username: data['username'],
        email: data['email'],
        password: data['password'],
        imageUrl: data['image_url'],
        isOnline: data['is_online'],
        lastSeen: data['last_seen']);
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'image_url': imageUrl,
      'is_online': isOnline,
      'last_seen': lastSeen
    };
  }
}
