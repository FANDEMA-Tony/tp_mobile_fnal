import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedShapePainter extends CustomPainter {
  double radius = 30;
  double radians;
  Color color;

  AnimatedShapePainter({
    required this.radius,
    required this.radians,
    this.color = Colors.yellow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double xc = size.width / 2;
    double yc = size.height / 2;

    double xc2 = xc + 2 * radius * cos(radians);
    double yc2 = yc + 2 * radius * sin(radians);

    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    final paint2 = Paint()
      ..color = Colors.deepOrange
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    final paint3 = Paint()
      ..color = color
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(xc, yc), radius * 2, paint);
    canvas.drawCircle(Offset(xc2, yc2), radius + 2, paint2);
    canvas.drawCircle(Offset(xc2, yc2), radius, paint3);

    final double xp = xc2 + radius * cos(radians * 3);
    final double yp = yc2 + radius * sin(radians * 3);
    canvas.drawCircle(Offset(xc2, yc2), 5, paint2);
    canvas.drawCircle(Offset(xp, yp), 10, paint2);
    canvas.drawLine(Offset(xc2, yc2), Offset(xp, yp), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
