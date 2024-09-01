import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/message_model.dart';
import 'package:chat_app/Services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    ChatModel chat = ChatModel(
        usersNames: ['issam', 'riyad'],
        usersId: ['1', '2'],
        lastMessage: 'hi',
        lastMessageDate: Timestamp.now());
    MessageModel msg = MessageModel(
        senderId: '1',
        recieverId: '2',
        date: Timestamp.now(),
        read: false,
        text: 'jhih',
        imageUrl: '');

   // ChatService.getAllChats('1');
    super.onInit();
  }
}
