import 'package:chat_app/Constantes/app_colors.dart';
import 'package:chat_app/View/Custum/ChatPage/chat_bod.dart';
import 'package:chat_app/View/Custum/ChatPage/bottom_section.dart';
import 'package:chat_app/View/Custum/ChatPage/top_section.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.mainColor,
      body: SafeArea(
        child: Column(
          children: [ChatTpoSection(),ChatBody(), ChatBottomSection()],
        ),
      ),
    );
  }
}
