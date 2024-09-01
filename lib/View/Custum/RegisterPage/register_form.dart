import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/View/Shared/myform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRegisterForm extends StatelessWidget {
  const MyRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const MyformField(
            hint: 'Username',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.person_2_rounded,
              color: MyColors.appColor,
            ),
          ),
          SizedBox(height: 15.h),
          const MyformField(
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.appColor,
            ),
          ),
          SizedBox(height: 15.h),
          const MyformField(
            hint: 'Password',
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_rounded,
              color: MyColors.appColor,
            ),
          ),
          SizedBox(height: 15.h),
          const MyformField(
            hint: 'Confirm Password',
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_rounded,
              color: MyColors.appColor,
            ),
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
