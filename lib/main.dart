import 'package:flutter/material.dart';

void main() {
  runApp(const MyBMICalculator());
}

class MyBMICalculator extends StatefulWidget {
  const MyBMICalculator({Key? key}) : super(key: key);

  @override
  State<MyBMICalculator> createState() => _MyBMICalculatorState();
}

class _MyBMICalculatorState extends State<MyBMICalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? _bmiResult;

  void _calculateBMI() {
    final height = double.tryParse(_heightController.text) ?? 0;
    final weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _bmiResult = weight / (height * height);
      });
    } else {
      // Handle invalid input
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your height in meters',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your weight in kilograms',
              ),
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            if (_bmiResult != null)
              Text(
                'Your BMI: ${_bmiResult!.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
