import 'dart:async';

import 'package:chat_app/Model/chat_model.dart';
import 'package:chat_app/Services/hive_services.dart';
import 'package:chat_app/View/Pages/home_page.dart';
import 'package:chat_app/View/Pages/login_page.dart';
import 'package:chat_app/main.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  List<ChatModel> chats = [];
}
