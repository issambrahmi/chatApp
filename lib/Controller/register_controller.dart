import 'dart:io';

import 'package:chat_app/Model/Enums/register_enum.dart';
import 'package:chat_app/Model/Enums/request_state_enum.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/Services/image_services.dart';
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
  RequestStateEnum state = RequestStateEnum.start;

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
    state = RequestStateEnum.waiting;
    update();
    if (registerKey.currentState!.validate()) {
      if (password.text == confirmPassword.text) {
        String? imageName;
        if (image != null) {
          imageName = await ImageServices.uploadImageToFireBase(
              File(image!.path), email.text.trim());
        }
        if (image == null || (image != null && imageName != null)) {
          RegisterEnum result = await AuthServices.createUser(UserModel(
              username: username.text,
              email: email.text,
              password: password.text,
              imageUrl: imageName,
              isOnline: true,
              lastSeen: Timestamp.now()));
          if (result == RegisterEnum.success) {
            state = RequestStateEnum.success;
            update();
            Get.offAll(() => const HomePage());
          } else {
            state = RequestStateEnum.error;
            update();
            debugPrint('error******');
          }
        } else {
          state = RequestStateEnum.error;
          update();
        }
      }
    }
  }
}
