import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
          centerTitle: true,
          actions: [
            const Icon(Icons.more_vert),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                child: const AssetsImage(
                  'assets/login.png',
                ),

                // image:
              )
            ],
          ),
        ));
  }
}
