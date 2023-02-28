import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCi5QBsONx2415O_ThX-NUUNT0Cxi3tvvg", // Your apiKey
    appId: "1:394293345781:android:c51223adff8decff26f4bc", // Your appId
    messagingSenderId: "394293345781", // Your project number
    projectId: "note-app-a4a0c",
    databaseURL:
        "https://note-app-a4a0c-default-rtdb.firebaseio.com/", //your realtime database
    storageBucket: "gs://note-app-a4a0c.appspot.com", //your storage url
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: HomeScreen(),
    );
  }
}
