// ignore_for_file: file_names, prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/forgotPassScreen.dart';
import 'package:todoapp/views/homeScreen.dart';
import 'package:todoapp/views/signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Sign In'),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: loginEmailController,
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
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: loginPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
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
                      child: const Text('Login'),
                      onPressed: () async {
                        var loginEmail = loginEmailController.text.trim();
                        var loginPassword = loginPasswordController.text.trim();
                        try {
                          final User? firebaseUser = (await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: loginEmail,
                                      password: loginPassword))
                              .user!;
                          if (firebaseUser != null) {
                            Get.to(() => HomeScreen());
                          } else {
                            print('Please enter correct email and password');
                          }
                        } on FirebaseAuthException catch (e) {
                          print(' Error $e');
                        }
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        child: const Text('Forgot Password'),
                        onPressed: () {
                          Get.to(const ForgotPassScreen());
                        })),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const SignUpScreen());
                  },
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Don't have an account Sign Up"),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
