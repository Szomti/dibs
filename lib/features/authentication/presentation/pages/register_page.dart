import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:dibs/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/dot_pattern_painter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
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
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: paddingMd),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: sizeSm),
                        RotationTransition(
                          turns: _animation,
                          child: const Text(
                            'Dibs!',
                            style: TextStyle(
                              fontSize: 56,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        const SizedBox(height: sizeLg),
                        const RegisterForm(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
