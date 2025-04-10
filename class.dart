import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('61_Q'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center( // Added Center widget to align the text in the middle
          child: Text('this is body of page'),
        ),
      ),
    ),
  );
}