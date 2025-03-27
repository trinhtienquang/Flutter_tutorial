import 'package:flutter/material.dart';
import 'package:demo_app/gradient_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [Colors.deepPurple, Colors.pinkAccent]),
        // body: GradientContainer.blue(),
      ),
    );
  }
}
