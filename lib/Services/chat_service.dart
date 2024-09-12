import 'package:chat_app/Controller/home_controller.dart';
import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatService {
  static final CollectionReference<Map<String, dynamic>> _chatRef =
      FirebaseFirestore.instance.collection('chat');

  static Future<List<ChatModel>> fetchChats(
      String? userId, DocumentSnapshot<Object?>? lastDoc) async {
    List<ChatModel> chats = [];
    try {
      if (userId == null) {
        throw Exception('userId null');
      }
      Query<Map<String, dynamic>> snap =
          _chatRef.where('users_id', arrayContains: userId);
      if (lastDoc != null) {
        snap = snap.startAfterDocument(lastDoc);
      }
      QuerySnapshot<Map<String, dynamic>> docs = await snap.get();
      for (var doc in docs.docs) {
        chats.add(ChatModel.fromFireStore(doc));
      }
      Get.find<HomeController>().lastDoc = docs.docs.last;
      return chats;
    } catch (e) {
      debugPrint('****** $e');
      return [];
    }
  }

  static Future<String> addChat(ChatModel chat) async {
    try {
      DocumentReference<Map<String, dynamic>> doc =
          await _chatRef.add(chat.toMap());
      return doc.id;
    } catch (e) {
      debugPrint('****** $e');
      return '';
    }
  }

  // static void addChat(ChatModel chat, MessageModel msg) async {
  //   try {
  //     DocumentReference<Map<String, dynamic>> doc =
  //         await _chatRef.add(chat.toMap());
  //     _chatRef.doc(doc.id).collection('messages').add(msg.toMap());
  //   } catch (e) {
  //     print('******** $e');
  //   }
  // }
}
