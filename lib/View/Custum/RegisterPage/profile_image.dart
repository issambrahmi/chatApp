import 'dart:io';

import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/Controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChooseProfilePic extends StatelessWidget {
  const ChooseProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find<RegisterController>();
    return GestureDetector(
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        controller.image =
            await imagePicker.pickImage(source: ImageSource.gallery);
        controller.update();
      },
      child: SizedBox(
        height: 80.sp,
        width: 80.sp,
        child: Stack(
          children: [
            GetBuilder<RegisterController>(builder: (controller) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: controller.image == null
                      ? Image.asset(
                          'assets/person.png',
                        )
                      : Image.file(
                          File(controller.image!.path),
                          fit: BoxFit.cover,
                          width: 80.sp,
                          height: 80.sp,
                        ));
            }),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: GetBuilder<RegisterController>(builder: (controller) {
                  return Icon(
                    controller.image == null
                        ? Icons.add_circle_outline_outlined
                        : Icons.create_rounded,
                    size: 22.sp,
                    color: controller.image == null
                        ? MyColors.appColor
                        : Colors.orange,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
