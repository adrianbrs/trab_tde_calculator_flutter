import 'package:calculadora/models/calculator_operation.dart';
import 'package:flutter/cupertino.dart';

class MultiplyOperation extends CalculatorOperation {
  MultiplyOperation()
      : super(
            name: 'Multiplicar',
            symbol: 'x',
            icon: const Icon(CupertinoIcons.multiply));

  @override
  num operate(num value1, num value2) {
    return value1 * value2;
  }
}
