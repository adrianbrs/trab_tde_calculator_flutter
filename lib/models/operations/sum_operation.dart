import 'package:calculadora/models/calculator_operation.dart';
import 'package:flutter/cupertino.dart';

class SumOperation extends CalculatorOperation {
  SumOperation()
      : super(
            name: 'Somar', symbol: '+', icon: const Icon(CupertinoIcons.plus));

  @override
  num operate(num value1, num value2) {
    return value1 + value2;
  }
}
