import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) {
          return Container();
        },
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
      ),
    );
  }
}
