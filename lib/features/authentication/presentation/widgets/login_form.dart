import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/custom_text_form_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _borderRadius = const BorderRadius.all(Radius.circular(defaultRadius));
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Form(
          key: _formKey,
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
              CustomTextFormField(
                enabled: !loginState.isLoading,
                labelText: 'Email',
                controller: _emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) return 'Field is empty';
                  final RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) return "Invalid email";
                  return null;
                },
              ),
              const SizedBox(height: sizeMd),
              CustomTextFormField(
                enabled: !loginState.isLoading,
                labelText: 'Password',
                validator: (String? value) {
                  if (value == null || value.isEmpty) return 'Field is empty';
                  if (value.length < 8) {
                    return 'Minimum 8 characters';
                  }
                  return null;
                },
                controller: _passwordController,
              ),
              const SizedBox(height: sizeMd),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: !loginState.isLoading
                          ? () {
                              final formState = _formKey.currentState;
                              if (formState == null || !formState.validate())
                                return;
                              ref
                                  .read(loginProvider.notifier)
                                  .login(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                            }
                          : null,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
