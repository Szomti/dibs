import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final login = ref.watch(loginProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(paddingMd),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _createHeader(),
              const SizedBox(height: sizeMd),
              EmailField(!login.isLoading, _emailController),
              const SizedBox(height: sizeMd),
              PasswordField(!login.isLoading, _passwordController),
              const SizedBox(height: sizeMd),
              _createLoginBtn(!login.isLoading),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createHeader() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Good to see you!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }

  Widget _createLoginBtn(bool enabled) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: enabled ? () => _loginPressed(ref) : null,
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  void _loginPressed(WidgetRef ref) {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) return;
    ref
        .read(loginProvider.notifier)
        .login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }
}
