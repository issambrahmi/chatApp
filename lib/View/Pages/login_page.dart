import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/auth_controller.dart';
import 'package:chat_app/Controller/login_controller.dart';
import 'package:chat_app/View/Custum/LoginPage/login_form.dart';
import 'package:chat_app/View/Pages/register_page.dart';
import 'package:chat_app/View/Shared/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
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
            SizedBox(height: 80.h),
            const MyLoginForm(),
            SizedBox(height: 20.h),
            MyButton(
              hieght: 50.h,
              width: double.infinity,
              text: 'Login',
              textSize: 22.sp,
              tap: () => controller.login(),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont Have an account ?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () => Get.to(() => const RegisterPage()),
                  child: Text(
                    'Sign UP',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.appColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
