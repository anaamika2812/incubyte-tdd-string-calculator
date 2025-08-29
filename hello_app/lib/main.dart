import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controller = TextEditingController();
  String _result = '0';

  // Test Case 1: Empty string returns 0
  // Test Case 2: Single number returns itself
  // Test Case 3: Two numbers separated by comma returns sum
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Test Case 4: Handle custom delimiter
    String delimiter = ",";
    if (numbers.startsWith("//")) {
      int newLineIndex = numbers.indexOf("\n");
      delimiter = numbers.substring(2, newLineIndex);
      numbers = numbers.substring(newLineIndex + 1);
    }

    // Test Case 5: Handle new lines as delimiters
    numbers = numbers.replaceAll("\n", delimiter);

    // Test Case 6: Handle any amount of numbers
    List<String> numArray = numbers.split(delimiter);
    List<int> numbersList = [];

    for (String num in numArray) {
      if (num.trim().isNotEmpty) {
        int number = int.parse(num.trim());
        // Test Case 7: Throw exception for negative numbers
        if (number < 0) {
          throw FormatException(
              "negative numbers not allowed ${numArray.where((n) => int.parse(n.trim()) < 0).join(',')}");
        }
        numbersList.add(number);
      }
    }

    // Test Case 8: Return sum of all numbers
    return numbersList.isNotEmpty ? numbersList.reduce((a, b) => a + b) : 0;
  }

  void calculate() {
    try {
      setState(() {
        _result = add(_controller.text).toString();
      });
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('String Calculator')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter numbers (e.g., 1,2 or //;\n1;2)'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Result: $_result', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}