import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            height: 25.h,
            width: (MediaQuery.of(context).size.width - 44.w - 10.w) / 2,
            decoration: BoxDecoration(
              color: MyColors.appColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Messages',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: MyColors.mainColor),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            height: 25.h,
            width: (MediaQuery.of(context).size.width - 44.w) / 2,
            decoration: BoxDecoration(
              color: MyColors.mainColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                'Active',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: MyColors.greyColor.shade600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
