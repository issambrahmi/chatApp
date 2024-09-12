import 'dart:io';

import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/main.dart';
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
              child: userImage == null
                  ? Image.asset(
                      'assets/person.png',
                      width: 40.sp,
                      height: 40.sp,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      userImage as File,
                      width: 40.sp,
                      height: 40.sp,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: 10.w),
            userData != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData!.username,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userData != null
                            ? (userData!.isOnline ? 'online' : 'offline')
                            : '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: userData!.isOnline
                              ? Colors.green
                              : MyColors.greyColor.shade600,
                        ),
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
