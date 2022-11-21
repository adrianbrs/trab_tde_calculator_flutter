import 'package:calculadora/models/calculator_form_data.dart';
import 'package:calculadora/models/calculator_operation.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationLog extends StatelessWidget {
  const OperationLog({super.key, required this.data, required this.result});

  final CalculatorFormData data;
  final String result;

  CalculatorOperation get operation => data.operation;

  Widget getIcon() {
    CalculatorOperation operation = data.operation;

    if (operation.icon != null) {
      return operation.icon!;
    }
    return Text(
      data.operation.symbol,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getTitle() {
    NumberFormat nf = NumberFormat('###0.0#########', 'pt-BR');
    String value1 = nf.format(DecimalIntl(Decimal.parse(data.value1)));
    String value2 = nf.format(DecimalIntl(Decimal.parse(data.value2)));
    String op = operation.symbol;
    return Text('$value1 $op $value2');
  }

  Widget getSubtitle() {
    NumberFormat nf = NumberFormat('###0.00########', 'pt-BR');
    String resultText = nf.format(DecimalIntl(Decimal.parse(result)));
    return Text(resultText);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: getIcon(),
        title: getTitle(),
        subtitle: getSubtitle(),
      ),
    );
  }
}
