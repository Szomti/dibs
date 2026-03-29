import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  const EmailField(this.enabled, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      enabled: enabled,
      labelText: 'Email',
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) return 'Field is empty';
        final RegExp emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (!emailRegex.hasMatch(value)) return "Invalid email";
        return null;
      },
    );
  }
}
