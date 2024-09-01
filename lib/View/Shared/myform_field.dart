import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyformField extends StatelessWidget {
  const MyformField({super.key, required this.hint, this.keyboardType, required this.prefixIcon});
  final String hint;
  final TextInputType? keyboardType;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextField(
        keyboardType:  keyboardType ?? keyboardType,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:  TextStyle(color: MyColors.greyColor.shade500),
            prefixIcon: prefixIcon,
            // contentPadding:
            //     EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            fillColor: MyColors.mainColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0, color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1))),
      ),
    );
  }
}
