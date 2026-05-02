import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: dims.sizeSm),
          AnimatedTitle(),
          SizedBox(height: dims.sizeLg),
          LoginForm(),
          _GoToRegisterButton(),
        ],
      ),
    );
  }
}

class _GoToRegisterButton extends StatelessWidget {
  const _GoToRegisterButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => context.push('/auth/register'),
            child: const Text('No account? Register now'),
          ),
        ),
      ],
    );
  }
}
