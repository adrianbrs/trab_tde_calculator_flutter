import 'package:flutter/cupertino.dart';

abstract class CalculatorOperation {
  CalculatorOperation({required this.name, required this.symbol, this.icon});

  final String name;
  final String symbol;
  final Icon? icon;

  String operate(String value1, String value2);
}
