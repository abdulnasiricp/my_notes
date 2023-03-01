// ignore_for_file: file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/signInScreen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text('Forgot Password'),

          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.amber[50],
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/login.jpg', height: 250),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: forgotPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: const Text('Forgot password'),
                      onPressed: () async {
                        var forgotEmail = forgotPasswordController.text.trim();
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgotEmail)
                              .then((value) => {
                                    print('Email send'),
                                    Get.off(() => const SignInScreen()),
                                  });
                        } on FirebaseAuthException catch (e) {
                          print('Error $e');
                        }
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
