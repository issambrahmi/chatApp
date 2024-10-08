import 'package:chat_app/Model/Enums/login_enum.dart';
import 'package:chat_app/Model/Enums/register_enum.dart';
import 'package:chat_app/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  static final userRef = FirebaseFirestore.instance.collection('user');
  static final userCredential = FirebaseAuth.instance;

  static Future<RegisterEnum> createUser(UserModel userModel) async {
    try {
      final user = await userCredential.createUserWithEmailAndPassword(
          email: userModel.email.trim(), password: userModel.password!);
      await userRef.doc(user.user!.uid).set(userModel.toMap());
      return RegisterEnum.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return RegisterEnum.emailAlreadyInUse;
        case 'invalid-email':
          return RegisterEnum.invalidEmail;
        case 'weak-password':
          return RegisterEnum.weakPassword;
        default:
          return RegisterEnum.unknownError;
      }
    } catch (e) {
      debugPrint('**** $e');
      return RegisterEnum.unknownError;
    }
  }

  static Future<LoginEnum> login(String email, String password) async {
    try {
      await userCredential.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return LoginEnum.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return LoginEnum.invalidEmail;
        case 'user-not-found':
          return LoginEnum.invalidEmail;
        case 'wrong-password':
          return LoginEnum.wrongPassword;
        default:
          return LoginEnum.uknownError;
      }
    } catch (e) {
      debugPrint('***** $e');
      return LoginEnum.uknownError;
    }
  }
}
