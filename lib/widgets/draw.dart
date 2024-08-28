import 'dart:math';

import 'package:flutter/material.dart';

class PizzaTimerPainter extends CustomPainter {
  final double remainingTimePercentage;
  final bool isTimerFinished;

  PizzaTimerPainter(this.remainingTimePercentage, this.isTimerFinished);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffCB463C)
      ..style = PaintingStyle.fill;

    double radius = size.width / 2;
    double startAngle = -pi / 2; // تبدأ من الأعلى

    if (isTimerFinished) {
      // رسم دائرة كاملة عند انتهاء الوقت
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        radius,
        paint,
      );
    } else {
      // رسم الدائرة المتقلصة مثل البيتزا
      double sweepAngle = 2 * pi * remainingTimePercentage;
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CrossLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(184, 184, 184, 60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // رسم الخط الأفقي
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    // رسم الخط الرأسي
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
