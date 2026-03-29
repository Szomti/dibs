import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/dot_pattern_painter.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -0.07,
      end: -0.03,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            DotPatternPainter.buildBackgroundWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: RotationTransition(
                        turns: _animation,
                        child: const Text(
                          'Dibs!',
                          style: TextStyle(fontSize: 56),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ),
                  const LoginForm(),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => context.push('/auth/register'),
                          child: const Text('No account? Register now'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
