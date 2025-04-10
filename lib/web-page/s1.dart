import 'package:flutter/material.dart';
import 'package:flutter_application_1/item.dart';

void main() {
  runApp(const Screen1());
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: 500,
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Items()
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}