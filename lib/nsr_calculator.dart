// ignore_for_file: library_private_types_in_public_api

library nsr_calculator;

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String currentNumber = '';
  String operation = '';
  double num1 = 0.0;
  double num2 = 0.0;
  bool shouldReset = false;

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '=') {
      _calculate();
    } else if (buttonText == '.') {
      _addDecimal();
    } else if (buttonText == '+/-') {
      _toggleSign();
    } else if ('0123456789'.contains(buttonText)) {
      _addDigit(int.parse(buttonText));
    } else {
      _setOperation(buttonText);
    }
  }

  void _clear() {
    setState(() {
      result = '0';
      currentNumber = '';
      operation = '';
      num1 = 0.0;
      num2 = 0.0;
      shouldReset = false;
    });
  }

  void _calculate() {
    if (operation.isEmpty || currentNumber.isEmpty) {
      return;
    }

    num2 = double.parse(currentNumber);

    switch (operation) {
      case '+':
        num1 = num1 + num2;
        break;
      case '-':
        num1 = num1 - num2;
        break;
      case '×':
        num1 = num1 * num2;
        break;
      case '÷':
        num1 = num1 / num2;
        break;
    }

    setState(() {
      result = num1.toString();
      currentNumber = '';
      operation = '';
      shouldReset = true;
    });
  }

  void _addDigit(int digit) {
    setState(() {
      if (shouldReset) {
        currentNumber = '';
        shouldReset = false;
      }

      if (currentNumber == '0') {
        currentNumber = digit.toString();
      } else {
        currentNumber += digit.toString();
      }

      if (result == '0' || operation.isNotEmpty) {
        result = currentNumber;
      } else {
        result += digit.toString();
      }
    });
  }

  void _addDecimal() {
    if (!currentNumber.contains('.')) {
      setState(() {
        currentNumber += '.';
        result += '.';
      });
    }
  }

  void _toggleSign() {
    if (currentNumber.isNotEmpty && currentNumber != '0') {
      setState(() {
        if (currentNumber.startsWith('-')) {
          currentNumber = currentNumber.substring(1);
          result = result.substring(1);
        } else {
          currentNumber = '-$currentNumber';
          result = '-$result';
        }
      });
    }
  }

  void _setOperation(String op) {
    if (currentNumber.isNotEmpty) {
      setState(() {
        if (operation.isNotEmpty) {
          _calculate();
        }

        num1 = double.parse(currentNumber);
        operation = op;
        shouldReset = true;
        result += op;
      });
    }
  }

  Widget _buildButton(String buttonText, {Color color = Colors.white}) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          _onButtonPressed(buttonText);
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: Colors.black,
          padding: const EdgeInsets.all(20),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              result,
              style: const TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('÷'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('×'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('C', color: Colors.red),
              _buildButton('0'),
              _buildButton('.', color: Colors.grey),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('+/-'),
              _buildButton('='),
            ],
          ),
        ],
      ),
    );
  }
}
