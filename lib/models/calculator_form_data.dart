import 'package:calculadora/models/calculator_operation.dart';

class CalculatorFormData {
  const CalculatorFormData({
    required this.value1,
    required this.value2,
    required this.operation,
  });

  final num value1;
  final num value2;
  final CalculatorOperation operation;
}
