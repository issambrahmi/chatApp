import 'dart:async';

import 'package:chat_app/Services/hive_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:chat_app/View/Pages/login_page.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    HiveServices.getLoginBox();
    Timer(const Duration(seconds: 5), () {
      if (isLogin == true) {
        HiveServices.getUserDataLocaly();
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => const LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
