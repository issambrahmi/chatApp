import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/login_controller.dart';
import 'package:chat_app/View/Shared/field_validator.dart';
import 'package:chat_app/View/Shared/myform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();
    return Form(
      key: controller.loginKey,
      child: Column(
        children: [
          MyformField(
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.email,
                color: MyColors.appColor,
              ),
              textController: controller.email,
              validator: (txt) => myValidator(
                    isRequired: true,
                    value: txt.toString(),
                    isEmail: true,
                    minLength: 13,
                  )),
          SizedBox(height: 15.h),
          GetBuilder<LoginController>(builder: (context) {
            return MyformField(
              hint: 'Password',
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: MyColors.appColor,
              ),
              isPassword: true,
              isObsecure: controller.isObsecure,
              eyeTap: () {
                controller.isObsecure = !controller.isObsecure;
                controller.update();
              },
              textController: controller.password,
              validator: (txt) => myValidator(
                isRequired: true,
                value: txt.toString(),
                isPassword: true,
                minLength: 13,
              ),
            );
          }),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
