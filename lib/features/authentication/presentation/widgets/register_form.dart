import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_field.dart';

class RegisterForm extends StatelessWidget {
  final _borderRadius = const BorderRadius.all(Radius.circular(defaultRadius));

  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Column(
          children: [
            const CustomTextField(labelText: 'Username'),
            const SizedBox(height: sizeMd),
            const CustomTextField(labelText: 'Password'),
            const SizedBox(height: sizeMd),
            const CustomTextField(labelText: 'Confirm password'),
            const SizedBox(height: sizeMd),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
