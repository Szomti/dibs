import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _borderRadius = const BorderRadius.all(Radius.circular(defaultRadius));
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
    final registerState = ref.watch(registerProvider);
    _onStateChange();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              NameField(!registerState.isLoading, _nameController),
              const SizedBox(height: sizeMd),
              EmailField(!registerState.isLoading, _emailController),
              const SizedBox(height: sizeMd),
              PasswordField(!registerState.isLoading, _passwordController),
              const SizedBox(height: sizeMd),
              ConfirmPasswordField(
                enabled: !registerState.isLoading,
                fieldController: _confirmPasswordController,
                passwordController: _passwordController,
              ),
              const SizedBox(height: sizeMd),
              _createRegisterBtn(!registerState.isLoading),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createRegisterBtn(bool enabled) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: enabled ? () async => _onRegisterPressed(ref) : null,
            child: const Text('Register'),
          ),
        ),
      ],
    );
  }

  void _onStateChange() {
    ref.listen(registerProvider, (prev, next) {
      if (next.value == true) {
        context.go('/auth/login');
      }
    });
  }

  Future<void> _onRegisterPressed(WidgetRef ref) async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) return;
    await ref
        .read(registerProvider.notifier)
        .register(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
  }
}
