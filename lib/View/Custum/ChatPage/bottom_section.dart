import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBottomSection extends StatelessWidget {
  const ChatBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(color: MyColors.mainColor, boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: MyColors.greyColor.shade700,
              blurRadius: 1,
            )
          ]),
          child: Row(
            children: [
              Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: 40.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: const TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
                          fillColor: MyColors.appColor.withOpacity(0.3),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  width: 0, color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1))),
                    ),
                  )),
              SizedBox(width: 10.w),
              Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: MyColors.appColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 1),
                          color: MyColors.appColor.withOpacity(0.5),
                          blurRadius: 4,
                        )
                      ]),
                  child: Center(
                    child: Icon(
                      Icons.send_rounded,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
