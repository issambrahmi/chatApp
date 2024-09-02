import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyformField extends StatelessWidget {
  const MyformField(
      {super.key,
      required this.hint,
      this.keyboardType,
      required this.prefixIcon,
      required this.textController,
      required this.validator,
      this.isPassword,
      this.eyeTap,
      this.isObsecure});
  final String hint;
  final TextInputType? keyboardType;
  final Widget prefixIcon;
  final TextEditingController textController;
  final String? Function(String?) validator;
  final bool? isPassword;
  final bool? isObsecure;
  final void Function()? eyeTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextFormField(
        controller: textController,
        validator: validator,
        obscureText: isObsecure ?? false,
        keyboardType: keyboardType ?? keyboardType,
        decoration: InputDecoration(
          // hintText: hint,
          // hintStyle: TextStyle(color: MyColors.greyColor.shade500),
          prefixIcon: prefixIcon,
          suffixIcon: isPassword == true
              ? GestureDetector(
                  onTap: eyeTap,
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    size: 20.sp,
                  ),
                )
              : null,

          // contentPadding:
          //     EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          //   fillColor: MyColors.mainColor,
          // //  filled: true,
          labelText: hint,
          labelStyle: TextStyle(color: MyColors.greyColor.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 1.5, color: MyColors.mainColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 1.5)),
        ),
      ),
    );
  }
}
