import 'dart:io';

import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/image_services.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static void saveUserDataLocaly(UserModel user, Uint8List image) async {
    final userBox = await Hive.openBox('user_box');
    final loginBox = await Hive.openBox<bool>('Login');

    try {
      await loginBox.put('is_login', true);
      String? img = await ImageServices.saveImageLocally(image, user.username);
      if (img != null) {
        user.imageUrl = img;
      }
      await userBox.put('user', user.toMap());
      // else {
      //   throw Exception('image didnt saved');
      // }
    } catch (e) {
      debugPrint('******* savedUserData $e');
    }
    userBox.close();
    loginBox.close();
  }

  static Future<UserModel?> getUserDataLocaly() async {
    final userBox = await Hive.openBox('user_box');

    try {
      Map<dynamic, dynamic>? user = userBox.get('user');
      userBox.close();
      if (user != null) {
        UserModel u = UserModel.fromMap(user);
        userData = u;
        if (u.imageUrl != null) {
          userImage = await ImageServices.loadImageLocaly(u.username);
        } else {
          throw Exception('failed to load image');
        }
        return userData;
      }
      return null;
    } catch (e) {
      debugPrint('******* $e');
      userBox.close();
      return null;
    }
  }

  static void loginBox() async {
    final loginBox = await Hive.openBox<bool>('Login');
    bool? result = loginBox.get('is_login');
    debugPrint('** $result');
    isLogin = result;
    loginBox.close();
  }

  static void logOut() async {
    final loginBox = await Hive.openBox<bool>('Login');
    await loginBox.put('is_login', false);
    loginBox.close();
  }

  static Future<List?> loadChats() async {
    final chatBox = await Hive.openBox('Chat');

   try {
      List? chats = chatBox.get('chats', defaultValue: []);
    return chats;
   } catch (e) {
      debugPrint('******* $e');
      chatBox.close();
      return null;
   }
  }
}
