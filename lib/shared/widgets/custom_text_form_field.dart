import 'package:flutter/material.dart';

import '../../core/constants/app_dimensions.dart' as dims;

class CustomTextFormField extends StatelessWidget {
  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(dims.defaultRadius)),
  );

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool enabled;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      validator: validator,
      enabled: enabled,
      obscureText: obscureText,
      decoration: InputDecoration(labelText: labelText, border: _border),
    );
  }
}
