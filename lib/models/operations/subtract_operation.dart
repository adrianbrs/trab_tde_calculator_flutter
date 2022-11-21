import 'package:calculadora/models/calculator_operation.dart';
import 'package:flutter/cupertino.dart';

class SubtractOperation extends CalculatorOperation {
  SubtractOperation()
      : super(
            name: 'Subtrair',
            symbol: '-',
            icon: const Icon(CupertinoIcons.minus));

  @override
  num operate(num value1, num value2) {
    return value1 - value2;
  }
}
