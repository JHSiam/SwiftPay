import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calculator> {
  final _n1 = TextEditingController(), _n2 = TextEditingController();
  String res = "The Answer is ";

  void calc(String op) {
    double a = double.tryParse(_n1.text) ?? 0, b = double.tryParse(_n2.text) ?? 0, r = 0;
    if (op == '+') r = a + b;
    if (op == '-') r = a - b;
    if (op == '*') r = a * b;
    if (op == '/' && b != 0) r = a / b;
    setState(() => res = (b == 0 && op == '/') ? "Error" : "The Ans: $r");
  }

  @override
  Widget build(BuildContext c) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calculator')),
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'orange-calculator.webp',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(controller: _n1, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Text 1', border: OutlineInputBorder(), filled: true, fillColor: Colors.white70)),
                  SizedBox(height: 10),
                  TextField(controller: _n2, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Text 2', border: OutlineInputBorder(), filled: true, fillColor: Colors.white70)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['+', '-', '*', '/'].map((op) => ElevatedButton(onPressed: () => calc(op), child: Text(op))).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(res, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
