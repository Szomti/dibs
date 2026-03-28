import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(marginXl)),
  );

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool enabled;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.enabled = true,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      validator: validator,
      enabled: enabled,
      decoration: InputDecoration(labelText: labelText, border: _border),
    );
  }
}
