import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String result = "";

  void calculate(String operator) {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;

    double output = 0;

    // Perform the operation based on the operator
    switch (operator) {
      case '+':
        output = num1 + num2;
        break;
      case '-':
        output = num1 - num2;
        break;
      case '*':
        output = num1 * num2;
        break;
      case '/':
        if (num2 != 0) {
          output = num1 / num2;
        } else {
          result = "Error: Division by 0";
          setState(() {});
          return;
        }
        break;
    }

    setState(() {
      result = output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First number input
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Second number input
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Operation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Result Text
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
