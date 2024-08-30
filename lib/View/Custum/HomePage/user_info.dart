import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUserInfos extends StatelessWidget {
  const HomeUserInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/person.png',
                  width: 40.sp,
                  height: 40.sp,
                )),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brahmi issam',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  'offline',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.greyColor.shade600),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
