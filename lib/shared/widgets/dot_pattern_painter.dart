import 'dart:ui';

import 'package:flutter/material.dart';

class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    final horizontalPoints = size.width ~/ 48 + 1;
    final verticalPoints = size.height ~/ 48 + 1;
    canvas.drawPoints(PointMode.points, [
      for (int i = 0; i < horizontalPoints; i++)
        for (int j = 0; j < verticalPoints; j++)
          Offset((j % 2 == 0 ? 8 : 32) + (i * 48), 16 + j * 48),
    ], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  static Widget buildBackgroundWidget() {
    return Positioned.fill(child: CustomPaint(painter: DotPatternPainter()));
  }
}
