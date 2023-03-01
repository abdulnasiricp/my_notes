import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetilesNoteScreen extends StatefulWidget {
  const DetilesNoteScreen({Key? key}) : super(key: key);
  _DetilesNoteScreenState createState() => _DetilesNoteScreenState();
}

class _DetilesNoteScreenState extends State<DetilesNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments['title'].toString(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: ListTile(
                title: Text(
                  Get.arguments['title'].toString(),
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  Get.arguments['note'].toString(),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
