import 'dart:io';
import 'dart:typed_data';

import 'package:chat_app/Model/Enums/login_enum.dart';
import 'package:chat_app/Model/Enums/request_state_enum.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/Services/hive_services.dart';
import 'package:chat_app/Services/image_services.dart';
import 'package:chat_app/Services/user_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool isObsecure = true;
  RequestStateEnum state = RequestStateEnum.start;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void login() async {
    state = RequestStateEnum.waiting;
    update();
    if (loginKey.currentState!.validate()) {
      LoginEnum result = await AuthServices.login(email.text, password.text);
      if (result == LoginEnum.success) {
        UserModel? user =
            await UserServices.getUserDataFromFireBase(email.text);
        if (user != null) {
          if (user.imageUrl != null) {
            Uint8List? userPic = await ImageServices.loadImageFromFireBase(
                user.imageUrl.toString());
            if (userPic != null) {
              HiveServices.saveUserDataLocaly(user, userPic);
              Get.offAll(() => const HomePage());
            } else {
              debugPrint('error******');
              state = RequestStateEnum.error;
              update();
            }
          }
        } else {
          debugPrint('error******');
          state = RequestStateEnum.error;
          update();
        }
      } else {
        debugPrint('error******');
        state = RequestStateEnum.error;
        update();
      }
    }
  }
}
