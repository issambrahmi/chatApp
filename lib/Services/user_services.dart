import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserServices {
  static final userRef = FirebaseFirestore.instance.collection('user');

  static Future<UserModel?> getUserDataFromFireBase(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> doc =
          await userRef.where('email', isEqualTo: email).get();
      userId = doc.docs.first.id;
      return UserModel.fromFireStore(doc.docs.first);
    } catch (e) {
      debugPrint('****** $e');
      return null;
    }
  }
}
