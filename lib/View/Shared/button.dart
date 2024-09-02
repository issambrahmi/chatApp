import 'package:chat_app/Constantes/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.hieght,
      required this.width,
      required this.text,
      required this.textSize,
      required this.tap});
  final double hieght;
  final double width;
  final String text;
  final double textSize;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: ()=> print(111),
      onTap: tap,
      child: Container(
        height: hieght,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: MyColors.appColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
