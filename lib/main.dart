import 'package:calculadora/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const CalculatorHomePage(title: 'Calculadora'),
      debugShowCheckedModeBanner: false,
    );
  }
}
