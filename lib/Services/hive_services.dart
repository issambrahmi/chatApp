import 'dart:io';

import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/image_services.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveServices {
  static Future<Box> getUserBox() async {
    return await Hive.openBox('user_box');
  }

  static void saveUserDataLocaly(UserModel user, File imageFile) async {
    final userBox = await Hive.openBox<Map<String, dynamic>>('user_box');
    final loginBox = await Hive.openBox<bool>('Login');

    try {
      String? img =
          await ImageServices.saveImageLocally(imageFile, user.username);
      if (img != 'null') {
        user.imageUrl = img;
        userBox.put('user', user.toMap());
        loginBox.put('is_login', true);
      } else {
        throw Exception('image didnt saved');
      }
    } catch (e) {
      debugPrint('******* $e');
    }
    userBox.close();
    loginBox.close();
  }

  static Future<UserModel?> getUserDataLocaly() async {
    final userBox = await Hive.openBox<Map<String, dynamic>>('user_box');
    try {
      File? img = await ImageServices.loadImageLocaly();
      if (img != null) {
        final user = userBox.get('user');
        userBox.close();
        return UserModel.fromMap(user as Map<String, dynamic>);
      } else {
        throw Exception('failed to load image');
      }
    } catch (e) {
      debugPrint('******* $e');
      userBox.close();
      return null;
    }
  }

  static void LoginBox() async {
    final loginBox = await Hive.openBox<bool>('Login');
    isLogin = loginBox.get('is_login');
    loginBox.close();
  }
}
