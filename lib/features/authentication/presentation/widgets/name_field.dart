import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_form_field.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Name',
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) return 'Field is empty';
        return null;
      },
    );
  }
}
