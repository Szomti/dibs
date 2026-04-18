import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/dot_pattern_painter.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const _padding = EdgeInsets.symmetric(horizontal: dims.sizeMd);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            DotPatternPainter.buildBackgroundWidget(),
            const Padding(
              padding: _padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Center(child: AnimatedTitle())),
                  LoginForm(),
                  _GoToRegisterButton(),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
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
