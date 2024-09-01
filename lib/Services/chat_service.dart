import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  static final CollectionReference<Map<String, dynamic>> _chatRef =
      FirebaseFirestore.instance.collection('chat');

  static Future<List<Map<String, dynamic>>> getAllChats(String userId) async {
    List<Map<String, dynamic>> chats = [];
    try {
      QuerySnapshot<Map<String, dynamic>> docs =
          await _chatRef.where('users_id', arrayContains: userId).get();
      for (var doc in docs.docs) {
        chats.add(doc.data());
      }
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
