import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../authentication.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  static const _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(dims.defaultRadius)),
  );
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final register = ref.watch(registerProvider);
    return Card(
      shape: _cardShape,
      child: Padding(
        padding: const EdgeInsets.all(dims.sizeMd),
        child: switch (register) {
          AsyncLoading<User?>() => const AuthCircularLoading(),
          AsyncData<User?>() => _createForm(),
          AsyncError<User?>(:final error) => _createForm('$error'),
        },
      ),
    );
  }

  Widget _createForm([String? error]) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          NameField(_nameController),
          const SizedBox(height: dims.sizeMd),
          EmailField(_emailController),
          const SizedBox(height: dims.sizeMd),
          PasswordField(_passwordController),
          const SizedBox(height: dims.sizeMd),
          ConfirmPasswordField(
            fieldController: _confirmPasswordController,
            passwordController: _passwordController,
          ),
          const SizedBox(height: dims.sizeMd),
          _createRegisterBtn(),
          if (error != null) ...[
            const SizedBox(height: dims.sizeMd),
            Text(error),
          ],
        ],
      ),
    );
  }

  Widget _createRegisterBtn() {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () => _onRegisterPressed(ref),
            child: const Text('Register'),
          ),
        ),
      ],
    );
  }

  void _onRegisterPressed(WidgetRef ref) {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) return;
    ref
        .read(registerProvider.notifier)
        .register(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        );
  }
}
