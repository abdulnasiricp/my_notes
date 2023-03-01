// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/signInScreen.dart';

SignUpUser(
  String userName,
  String userPhone,
  String userEmail,
  String userPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    FirebaseFirestore.instance.collection('Users').doc(userid!.uid).set({
      'userName': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(const SignInScreen()),
        });
  } on FirebaseAuthException catch (e) {
    print('Error $e');
  }
}
