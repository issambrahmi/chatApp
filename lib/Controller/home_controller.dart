import 'package:chat_app/Model/Enums/request_state_enum.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/message_model.dart';
import 'package:chat_app/Services/chat_service.dart';
import 'package:chat_app/Services/hive_services.dart';
import 'package:chat_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class HomeController extends GetxController {
  DocumentSnapshot<Object?>? lastDoc;
  RequestStateEnum state = RequestStateEnum.start;
  List<ChatModel> chats = [];
  @override
  void onInit() {
    loadData();

    // ChatModel chat = ChatModel(
    //     usersNames: ['issam', 'riyad'],
    //     usersId: ['1', '2'],
    //     lastMessage: 'hi',
    //     lastMessageDate: Timestamp.now());
    // MessageModel msg = MessageModel(
    //     senderId: '1',
    //     recieverId: '2',
    //     date: Timestamp.now(),
    //     read: false,
    //     text: 'jhih',
    //     imageUrl: '');

    super.onInit();
  }

  void loadData() async {
    state = RequestStateEnum.waiting;
    update();
    chats = await ChatService.fetchChats(userId, lastDoc);
    state = RequestStateEnum.success;
    update();
    print(chats.length);
  }
}
