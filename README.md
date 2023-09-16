<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A sharable calculator package

## Features

- Basic functionality of calculator

## Getting started

No prerequisites to use this package
Just import the package `import 'package:nsr_calculator/nsr_calculator.dart';` and start using it 

You can find the source code of package at https://github.com/momin96/nsr_calculator

## Usage

Just a sample, yet to update how to use it
```dart
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
```

## Additional information

For more information you can reach to 
https://nasirmomin.web.app or https://github.com/momin96
