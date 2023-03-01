// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/homeScreen.dart';

class CreateNotesScreen extends StatefulWidget {
  const CreateNotesScreen({Key? key}) : super(key: key);
  @override
  _CreateNotesScreenState createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  TextEditingController createNoteController = TextEditingController();
  TextEditingController createTitleController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Notes'),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: createTitleController,
                  decoration: InputDecoration(hintText: 'Add Title'),
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: createNoteController,
                  decoration: InputDecoration(hintText: 'Add Note'),
                  maxLines: null,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var createTitle = createTitleController.text.trim();
                  var createNote = createNoteController.text.trim();
                  if (createNote != "" && createTitle != "") {
                    try {
                      await FirebaseFirestore.instance
                          .collection('Notes')
                          .doc()
                          .set({
                        'createdAt': DateTime.now(),
                        'note': createNote,
                        'title': createTitle,
                        'userId': userId?.uid,
                      }).then((value) => {
                                Get.offAll(() => HomeScreen()),
                              });
                    } on FirebaseAuthException catch (e) {
                      print("Error $e");
                    }
                  }
                },
                child: Text('Add Note')),
          ],
        )));
  }
}
