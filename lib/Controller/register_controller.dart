import 'package:chat_app/Model/Enums/register_enum.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController username;
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  XFile? image;
  bool isPassword = true;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    username.dispose();
    super.onClose();
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
          Get.offAll(() => const HomePage());
        } else {
          debugPrint('error******');
        }
      }
    }
  }
}
