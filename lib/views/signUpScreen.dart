// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/services/signUpServices.dart';
import 'package:todoapp/views/signInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Sign Up'),
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
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                    controller: passwordController,
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
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        var userName = usernameController.text.trim();
                        var userPhone = phoneController.text.trim();
                        var userEmail = emailController.text.trim();
                        var userPassword = passwordController.text.trim();

                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: userEmail, password: userPassword)
                            .then((value) => {
                                  SignUpUser(userName, userPhone, userEmail,
                                      userPassword),
                                });
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const SignInScreen());
                  },
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Already have an account Sign In"),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
