import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/views/homeScreen.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController editNoteController = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'
            // Get.arguments['title'].toString(),
            ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: TextFormField(
                controller: editTitleController
                  ..text = "${Get.arguments['title'].toString()}",
                decoration: InputDecoration(),
                maxLines: null,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: TextFormField(
                controller: editNoteController
                  ..text = "${Get.arguments['note'].toString()}",
                decoration: InputDecoration(),
                maxLines: null,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection('Notes')
                    .doc(Get.arguments['docId'].toString())
                    .update({
                  'title': editTitleController.text.trim(),
                  'note': editNoteController.text.trim(),
                }).then((value) => {
                          Get.offAll(() => HomeScreen()),
                        });
              },
              child: Text('Update')),
        ],
      )),
    );
  }
}
