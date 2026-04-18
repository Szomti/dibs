import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_form_field.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController fieldController;
  final TextEditingController passwordController;

  const ConfirmPasswordField({
    required this.fieldController,
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Confirm Password',
      obscureText: true,
      controller: fieldController,
      validator: (String? value) {
        if (value == null || value.isEmpty) return 'Field is empty';
        if (value != passwordController.text) return 'Passwords do not match';
        return null;
      },
    );
  }
}
