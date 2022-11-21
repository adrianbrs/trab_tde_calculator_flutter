import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({
    super.key,
    required this.label,
    this.controller,
    this.value,
    this.onChanged,
    this.error,
    this.icon,
    this.allowDecimal = true,
    this.disabled = false,
    this.validator,
    this.onSaved,
  });

  final TextEditingController? controller;
  final String? value;
  final String label;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;
  final bool disabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: value,
      onChanged: onChanged,
      readOnly: disabled,
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(_getRegexString())),
        TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.copyWith(
                  text: newValue.text.replaceAll('.', ','),
                )),
      ],
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        errorText: error,
        icon: icon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  String _getRegexString() =>
      allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
