import 'package:cloud_firestore/cloud_firestore.dart';

class AppConstanntes {
  static CollectionReference<Map<String, dynamic>> userRef =
      FirebaseFirestore.instance.collection('user');
  static CollectionReference<Map<String, dynamic>> chatRef =
      FirebaseFirestore.instance.collection('chat');

  static String userBox = 'user_box';
  static String loginBox = 'login_box';

}
