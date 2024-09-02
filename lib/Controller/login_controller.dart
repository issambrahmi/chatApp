import 'package:chat_app/Model/Enums/login_enum.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool isObsecure = true;

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
    if (loginKey.currentState!.validate()) {
      LoginEnum result = await AuthServices.login(email.text, password.text);
      if (result == LoginEnum.success) {
        Get.offAll(() => const HomePage());
      } else {
        debugPrint('error******');
      }
    }
  }
}
