import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../../shared/widgets/dot_pattern_painter.dart';

class AuthPageScaffold extends StatelessWidget {
  static const _padding = EdgeInsets.symmetric(horizontal: dims.sizeMd);

  final Widget child;

  const AuthPageScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DotPatternPainter.buildBackgroundWidget(),
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: _padding,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: child,
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
