import 'package:calculadora/models/calculator_operation.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class MultiplyOperation extends CalculatorOperation {
  MultiplyOperation()
      : super(
            name: 'Multiplicar',
            symbol: 'x',
            icon: const Icon(CupertinoIcons.multiply));

  @override
  String operate(String value1, String value2) {
    return (Decimal.parse(value1) * Decimal.parse(value2)).toString();
  }
}
