import 'dart:ffi';

import 'package:chat_app/Constantes/constantes.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static void saveUserDataLocaly(UserModel user) async {
    final userBox = await Hive.openBox(AppConstanntes.userBox);
    final loginBox = await Hive.openBox<bool>(AppConstanntes.loginBox);

    try {
      await userBox.put('user', {...user.toMap(), 'user_id': userId});
      loginBox.put('is_login', true);
    } catch (e) {
      debugPrint('******* savedUserData $e');
    }
    userBox.close();
    loginBox.close();
  }

  static void getUserDataLocaly() async {
    final userBox = await Hive.openBox(AppConstanntes.userBox);

    try {
      Map result = userBox.get('user');
      userId = result['user_id'];
      result.remove('user_id');
      Map<dynamic, dynamic>? user = result;
      userBox.close();
      userData = UserModel.fromMap(user);
    } catch (e) {
      debugPrint('******11* $e');
      userBox.close();
    }
  }

  // static Future<UserModel?> getUserDataFromFireBase() async {

  //   try {

  //    await FirebaseFirestore.instance.collection('user').wh
  //     return null;
  //   } catch (e) {
  //     debugPrint('******* $e');
  //     userBox.close();
  //     return null;
  //   }
  // }

  static void getLoginBox() async {
    final loginBox = await Hive.openBox<bool>(AppConstanntes.loginBox);

    try {
      bool? result = loginBox.get('is_login');
      debugPrint('** $result');
      isLogin = result;
    } catch (e) {
      debugPrint('**** $e');
    }
    loginBox.close();
  }

  static void logOut() async {
    final loginBox = await Hive.openBox<bool>('Login');
    await loginBox.put('is_login', false);
    loginBox.close();
  }

  static Future<List<ChatModel>> loadChats(String id) async {
    List<ChatModel> chats = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshots = await FirebaseFirestore
          .instance
          .collection('chat')
          .where('users_id', arrayContains: id)
          .get();
      for (var doc in snapshots.docs) {
        chats.add(ChatModel.fromFireStore(doc));
      }
      return chats;
    } catch (e) {
      debugPrint('******* $e');
      return [];
    }
  }
}
