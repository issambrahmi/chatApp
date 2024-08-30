import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseProfilePic extends StatelessWidget {
  const ChooseProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      width: 80.sp,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.white),
          borderRadius: BorderRadius.circular(60)),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/person.png',
                
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.add_circle_outline_outlined,
              size: 22.sp,
              color: MyColors.appColor,
            ),
          )
        ],
      ),
    );
  }
}
