import 'package:calculadora/models/calculator_operation.dart';
import 'package:flutter/cupertino.dart';

class DivideOperation extends CalculatorOperation {
  DivideOperation()
      : super(
            name: 'Dividir',
            symbol: '/',
            icon: const Icon(CupertinoIcons.divide));

  @override
  num operate(num value1, num value2) {
    return value1 / value2;
  }
}
