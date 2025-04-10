import 'package:flutter/material.dart';
import 'package:flutter_application_1/s1.dart';
import 'package:flutter_application_1/s2.dart';
import 'package:flutter_application_1/s3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current_ind = 0;
  List<Widget> body_item = [
    Screen1(),
    Screen2(),
    Screen3()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shop you'),
          backgroundColor: Colors.redAccent,
        ),
        body: body_item[current_ind],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              current_ind = index;
            });
          },
          currentIndex: current_ind,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ],
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}