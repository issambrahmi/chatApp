import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserIcon extends StatelessWidget {
  const UserIcon(
      {super.key,
      required this.hight,
      required this.width,
      required this.userPic});
  final double hight;
  final double width;
  final String userPic;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: hight,
        height: width,
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: userPic == ""
                  ? Image.asset(
                      'assets/person.png',
                    )
                  : Image.network(userPic)),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 10.sp,
              height: 10.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60), color: Colors.green),
            ),
          ),
        ]));
  }
}
