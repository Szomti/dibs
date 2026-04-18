import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_form_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Password',
      controller: controller,
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.isEmpty) return 'Field is empty';
        if (value.length < 8) {
          return 'Minimum 8 characters';
        }
        return null;
      },
    );
  }
}
