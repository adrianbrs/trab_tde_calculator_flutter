import 'package:calculadora/models/calculator_operation.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class SubtractOperation extends CalculatorOperation {
  SubtractOperation()
      : super(
            name: 'Subtrair',
            symbol: '-',
            icon: const Icon(CupertinoIcons.minus));

  @override
  String operate(String value1, String value2) {
    return (Decimal.parse(value1) - Decimal.parse(value2)).toString();
  }
}
