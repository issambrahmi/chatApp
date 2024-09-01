import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/home_controller.dart';
import 'package:chat_app/View/Custum/HomePage/down_section.dart';
import 'package:chat_app/View/Custum/HomePage/top_section.dart';
import 'package:chat_app/View/Custum/HomePage/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              const HomeUserInfos(),
              SizedBox(height: 15.h),
              const HomeTopSection(),
              SizedBox(height: 15.h),
              const HomeDownSection(),
            ],
          ),
        ),
      ),
    );
  }
}
