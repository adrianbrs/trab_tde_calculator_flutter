import 'package:calculadora/models/calculator_operation.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class SumOperation extends CalculatorOperation {
  SumOperation()
      : super(
            name: 'Somar', symbol: '+', icon: const Icon(CupertinoIcons.plus));

  @override
  String operate(String value1, String value2) {
    return (Decimal.parse(value1) + Decimal.parse(value2)).toString();
  }
}
