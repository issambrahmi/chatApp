import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/home_controller.dart';
import 'package:chat_app/Model/Enums/request_state_enum.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/View/Shared/user_icon.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeDownSection extends StatelessWidget {
  const HomeDownSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.state == RequestStateEnum.waiting
          ? const CircularProgressIndicator()
          : controller.state == RequestStateEnum.success
              ? Expanded(
                  child: ListView.builder(
                    itemCount: controller.chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustumListTile(chat: controller.chats[index]);
                    },
                  ),
                )
              : const Center(
                  child: Text('error'),
                );
    });
  }
}

class CustumListTile extends StatelessWidget {
  const CustumListTile({super.key, required this.chat});
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: UserIcon(
        hight: 40.sp,
        width: 40.sp,
        userPic: chat.firstUserId == userId
            ? chat.usersImages[1]
            : chat.usersImages[0],
      ),
      title: Text(
        chat.firstUserId == userId ? chat.usersNames[1] : chat.usersNames[0],
        style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(right: 70.w),
        child: Text(
          chat.lastMessage,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.greyColor.shade600,
          ),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${chat.lastMessageDate.toDate().hour}:${chat.lastMessageDate.toDate().minute}',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.greyColor.shade600,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: 18.sp,
            height: 18.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: MyColors.appColor,
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
