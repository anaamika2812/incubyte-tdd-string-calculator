import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controller = TextEditingController();
  String _result = '0';
  final StringCalculator _calculator = StringCalculator();

  void calculate() {
    try {
      setState(() {
        _result = _calculator.add(_controller.text).toString();
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