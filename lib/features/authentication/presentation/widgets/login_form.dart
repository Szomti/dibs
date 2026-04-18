import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  static const _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(dims.defaultRadius)),
  );
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
      shape: _cardShape,
      child: Padding(
        padding: const EdgeInsets.all(dims.sizeMd),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const _LoginHeader(),
              const SizedBox(height: dims.sizeMd),
              switch (login) {
                AsyncLoading<User?>() => const AuthCircularLoading(),
                AsyncData<User?>() => _createForm(),
                AsyncError<User?>(:final error) => _createForm('$error'),
              },
            ],
          ),
        ),
      ),
    );
  }

  Widget _createForm([String? error]) {
    return Column(
      children: [
        EmailField(_emailController),
        const SizedBox(height: dims.sizeMd),
        PasswordField(_passwordController),
        const SizedBox(height: dims.sizeMd),
        _createLoginBtn(),
        if (error != null) ...[
          const SizedBox(height: dims.sizeMd),
          Text(error),
        ],
      ],
    );
  }

  Widget _createLoginBtn() {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () => _loginPressed(ref),
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

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
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
}
