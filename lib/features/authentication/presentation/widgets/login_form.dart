import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final _borderRadius = const BorderRadius.all(Radius.circular(defaultRadius));

  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Good to see you!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            const SizedBox(height: sizeMd),
            const CustomTextField(labelText: 'Username'),
            const SizedBox(height: sizeMd),
            const CustomTextField(labelText: 'Password'),
            const SizedBox(height: sizeMd),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Login'),
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
