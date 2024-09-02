import 'package:chat_app/Model/Enums/login_enum.dart';
import 'package:chat_app/Model/Enums/register_enum.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController username;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  void login() async {
    if (loginKey.currentState!.validate()) {
      LoginEnum result = await AuthServices.login(email.text, password.text);
      if (result == LoginEnum.success) {
        Get.toEnd(() => const HomePage());
      } else {
        debugPrint('error******');
      }
    }
  }

  void register() async {
    if (registerKey.currentState!.validate()) {
      if (password.text == confirmPassword.text) {
        RegisterEnum result = await AuthServices.createUser(UserModel(
            username: username.text,
            email: email.text,
            password: password.text,
            isOnline: true,
            lastSeen: Timestamp.now()));
        if (result == RegisterEnum.success) {
          Get.toEnd(() => const HomePage());
        } else {
          debugPrint('error******');
        }
      }
    }
  }
}
