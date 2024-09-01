import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ListView.separated(
        itemCount: 10,
        reverse: true,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 5.h);
        },
        itemBuilder: (BuildContext context, int index) {
          return MessageCard(
            index: index,
          );
        },
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: index % 2 == 0 ? 20.w : 100.w,
        right: index % 2 == 0 ? 80.w : 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index % 2 == 0
                  ? Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/person.png',
                          width: 30.sp,
                          height: 30.sp,
                        ),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(width: 5.w),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index % 2 == 0
                        ? MyColors.greyColor.withOpacity(0.7)
                        : MyColors.appColor,
                  ),
                  child: Text(
                    'hello issammmmmmmmmmmmmm',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment:
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: index % 2 == 0 ? 40.w : 0.w,
                top: 5.h,
              ),
              child: Text(
                '9.25 PM',
                style: TextStyle(
                  color: MyColors.greyColor.shade800,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
