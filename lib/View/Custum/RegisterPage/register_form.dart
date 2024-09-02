import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/register_controller.dart';
import 'package:chat_app/View/Shared/field_validator.dart';
import 'package:chat_app/View/Shared/myform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyRegisterForm extends StatelessWidget {
  const MyRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find<RegisterController>();
    return Form(
      key: controller.registerKey,
      child: Column(
        children: [
          MyformField(
            hint: 'Username',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.person_2_rounded,
              color: MyColors.appColor,
            ),
            textController: controller.username,
            validator: (txt) => myValidator(
              isRequired: true,
              value: txt.toString(),
              minLength: 5,
            ),
          ),
          SizedBox(height: 15.h),
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
            ),
          ),
          SizedBox(height: 15.h),
          GetBuilder<RegisterController>(builder: (c) {
            return MyformField(
              hint: 'Password',
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: MyColors.appColor,
              ),
              isPassword: true,
              isObsecure: controller.isPassword,
              eyeTap: () {
                controller.isPassword = !controller.isPassword;
                controller.update();
              },
              textController: controller.password,
              validator: (txt) => myValidator(
                isRequired: true,
                value: txt.toString(),
                isPassword: true,
                minLength: 8,
              ),
            );
          }),
          SizedBox(height: 15.h),
          GetBuilder<RegisterController>(builder: (context) {
            return MyformField(
              hint: 'Confirm Password',
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.lock_rounded,
                color: MyColors.appColor,
              ),
              isPassword: true,
              isObsecure: controller.isPassword,
              eyeTap: () {
                controller.isPassword = !controller.isPassword;
                controller.update();
              },
              textController: controller.confirmPassword,
              validator: (txt) => myValidator(
                isRequired: true,
                value: txt.toString(),
                isPassword: true,
                minLength: 8,
              ),
            );
          }),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
