import 'package:chat_app/View/Shared/myform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const MyformField(hint: 'Email' , keyboardType: TextInputType.emailAddress,),
          SizedBox(height: 15.h),
          const MyformField(hint: 'Password' , keyboardType: TextInputType.text,),
          SizedBox(height: 25.h),

        ],
      ),
    );
  }
}
