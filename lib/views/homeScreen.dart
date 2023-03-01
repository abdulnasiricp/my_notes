// ignore_for_file: prefer_const_constructors,, unnecessary_null_comparison, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:todoapp/views/createNotesScreen.dart';
import 'package:todoapp/views/detilesNoteScreen.dart';
import 'package:todoapp/views/editNoteScreen.dart';
import 'package:todoapp/views/signInScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Notes'),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Get.off(() => SignInScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.logout),
                )),
          ]),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Notes')
              .where('userId', isEqualTo: userId?.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong!');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CupertinoActivityIndicator());
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No Data Found!'));
            }
            if (snapshot != null && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var note = snapshot.data!.docs[index]['note'];
                  var title = snapshot.data!.docs[index]['title'];
                  var docId = snapshot.data!.docs[index].id;
                  Timestamp date = snapshot.data!.docs[index]['createdAt'];
                  var finalDate = DateTime.parse(date.toDate().toString());
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetilesNoteScreen(), arguments: {
                        'title': title,
                        'note': note,
                        'docId': docId
                      });
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(GetTimeAgo.parse(finalDate)),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                Get.to(EditNoteScreen(), arguments: {
                                  'title': title,
                                  'note': note,
                                  'docId': docId
                                });
                              },
                              icon: Icon(Icons.edit)),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('Notes')
                                    .doc(docId)
                                    .delete();
                              },
                              icon: Icon(Icons.delete))
                        ]),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateNotesScreen());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
