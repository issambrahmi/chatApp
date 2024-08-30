import 'package:chat_app/View/Shared/user_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTpoSection extends StatelessWidget {
  const ChatTpoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25.sp,
            color: Colors.black,
          ),
          SizedBox(width: 10.w),
          UserIcon(
            hight: 30.sp,
            width: 30.sp,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brahmi issam',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'online',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
