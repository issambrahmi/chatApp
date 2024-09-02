import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class ImageServices {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String?> saveImageLocally(
      File imageFile, String userName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String fileName = userName;
      final File localImage = await imageFile.copy('$path/$fileName');
      return localImage.path;
    } catch (e) {
      debugPrint('Error saving image: $e');
      return null;
    }
  }

  static Future<File?> loadImageLocaly() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String path = '${directory.path}/user_profile_image.png';
      return File(path);
    } catch (e) {
      debugPrint('Error loading image: $e');
      return null;
    }
  }

  static Future<String?> uploadImageToFireBase(
      File file, String fileName) async {
    try {
      Reference ref = _storage.ref().child('users/$fileName');
      UploadTask uploadTask = ref.putFile(file);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return fileName;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return null;
    }
  }

  static Future<Uint8List?> loadImageFromFireBase(String imageName) async {
    try {
      // Get a reference to the Firebase Storage location
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('users/$imageName');

      // Get the download URL
      Uint8List? url = await ref.getData();

      return url;
    } catch (e) {
      debugPrint('Error occurred while loading image: $e');
      return null;
    }
  }
}
