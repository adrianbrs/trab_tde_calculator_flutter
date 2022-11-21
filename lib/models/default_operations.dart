import 'package:calculadora/models/calculator_operation.dart';
import 'package:calculadora/models/operations/divide_operation.dart';
import 'package:calculadora/models/operations/multiply_operation.dart';
import 'package:calculadora/models/operations/subtract_operation.dart';
import 'package:calculadora/models/operations/sum_operation.dart';

class DefaultOperations {
  static List<CalculatorOperation> values = <CalculatorOperation>[
    SumOperation(),
    SubtractOperation(),
    MultiplyOperation(),
    DivideOperation()
  ];
}
