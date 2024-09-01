import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/View/Custum/LoginPage/form.dart';
import 'package:chat_app/View/Custum/RegisterPage/profile_image.dart';
import 'package:chat_app/View/Custum/RegisterPage/register_form.dart';
import 'package:chat_app/View/Shared/button.dart';
import 'package:chat_app/View/Shared/myform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/logo.png',
              width: double.infinity,
              height: 60.h,
              fit: BoxFit.contain,
            )),
            SizedBox(height: 40.h),
            const ChooseProfilePic(),
            SizedBox(height: 40.h),
            const MyRegisterForm(),
            SizedBox(height: 20.h),
            MyButton(
              hieght: 50.h,
              width: 200.w,
              text: 'Sign Up',
              textSize: 22.sp,
            )
          ],
        ),
      ),
    );
  }
}
