import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      this.label,
      required this.onChanged,
      this.textInputType = TextInputType.text});

  final TextEditingController controller;
  final String? label;
  final Function(String) onChanged;
  final TextInputType textInputType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        label: widget.label != null
            ? Text(widget.label ?? '',
                style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.primaryContainer))
            : null,
        disabledBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
      ),
    );
  }
}
