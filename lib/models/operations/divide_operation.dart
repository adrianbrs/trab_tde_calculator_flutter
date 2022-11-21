import 'package:calculadora/models/calculator_operation.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class DivideOperation extends CalculatorOperation {
  DivideOperation()
      : super(
            name: 'Dividir',
            symbol: '/',
            icon: const Icon(CupertinoIcons.divide));

  @override
  String operate(String value1, String value2) {
    return (Decimal.parse(value1) / Decimal.parse(value2)).toString();
  }
}
