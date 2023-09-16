import 'package:flutter/material.dart';
import 'package:nsr_calculator/nsr_calculator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Calculator(),
      ),
    );
  }
}
