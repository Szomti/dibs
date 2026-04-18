import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:dibs/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/dot_pattern_painter.dart';
import '../../authentication.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const _padding = EdgeInsets.symmetric(horizontal: dims.sizeMd);

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
                  padding: _padding,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: dims.sizeSm),
                        AnimatedTitle(),
                        SizedBox(height: dims.sizeLg),
                        RegisterForm(),
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
