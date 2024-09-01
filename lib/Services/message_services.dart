import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/message_model.dart';
import 'package:chat_app/Services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageServices {
  static final CollectionReference<Map<String, dynamic>> _chatRef =
      FirebaseFirestore.instance.collection('chat');

  static void addMessage(MessageModel msg, String chatId) async {
    try {
      await _chatRef.doc(chatId).collection('messages').add(msg.toMap());
    } catch (e) {
      debugPrint('****** $e');
    }
  }

  static void createChatAndAddMsg(MessageModel msg, ChatModel chat) async {
    try {
      final chatId = ChatService.addChat(chat).toString();
      if (chatId != '') {
        await _chatRef
            .doc(chatId)
            .collection('messages')
            .add(msg.toMap());
      }
    } catch (e) {
      debugPrint('****** $e');
    }
  }
}
