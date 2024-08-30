import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/View/Custum/HomePage/down_section.dart';
import 'package:chat_app/View/Custum/HomePage/top_section.dart';
import 'package:chat_app/View/Custum/HomePage/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              const HomeUserInfos(),
              SizedBox(height: 15.h),
              const HomeTopSection(),
              SizedBox(height: 15.h),
             HomeDownSection(),
            ],
          ),
        ),
      ),
    );
  }
}
