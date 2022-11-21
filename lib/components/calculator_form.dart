import 'package:calculadora/components/number_input.dart';
import 'package:calculadora/models/calculator_form_data.dart';
import 'package:calculadora/models/calculator_operation.dart';
import 'package:calculadora/models/default_operations.dart';
import 'package:flutter/material.dart';

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({super.key, required this.submit});

  final void Function(CalculatorFormData) submit;

  @override
  State<StatefulWidget> createState() {
    return _CalculatorFormState();
  }
}

class _CalculatorFormState extends State<CalculatorForm> {
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<CalculatorOperation>> operationsMenuItems =
      DefaultOperations.values
          .map((op) => DropdownMenuItem(
                value: op,
                child: Text(op.name),
              ))
          .toList();

  String? value1, value2;
  CalculatorOperation selectedOperation = DefaultOperations.values.first;

  String? Function(String?) numberInputValidatorFactory(String message) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return message;
      }
      return null;
    };
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.submit(CalculatorFormData(
        value1: value1!.replaceAll(',', '.'),
        value2: value2!.replaceAll(',', '.'),
        operation: selectedOperation,
      ));

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: NumberInput(
                  label: 'Valor 1',
                  validator: numberInputValidatorFactory('Informe o valor 1'),
                  onSaved: (value) => value1 = value,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: NumberInput(
                  label: 'Valor 2',
                  validator: numberInputValidatorFactory('Informe o valor 2'),
                  onSaved: (value) => value2 = value,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                  child: DropdownButtonFormField<CalculatorOperation>(
                items: operationsMenuItems,
                onChanged: (op) => selectedOperation = op!,
                value: selectedOperation,
                validator: (value) =>
                    value == null ? 'Campo obrigatório' : null,
                decoration: const InputDecoration(
                  label: Text('Selecione a Operação'),
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  fixedSize: const Size(200, 54),
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
              onPressed: _submit,
              child: const Text('Calcular'),
            ),
          )
        ],
      ),
    );
  }
}
