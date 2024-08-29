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
    Paint paint = Paint()..color = const Color.fromRGBO(184, 184, 184, 60);

    const double borderRadius = 5; // تحديد نصف القطر للزوايا المستديرة
    const double padding = 50.0; // المسافة من الحافة

    // رسم المستطيل ذو الزوايا المستديرة
    RRect topLine = RRect.fromLTRBR(
      padding,
      size.height / 2 - 2.5,
      size.width - padding,
      size.height / 2 + 2.5,
      const Radius.circular(borderRadius),
    );

    RRect leftLine = RRect.fromLTRBR(
      size.width / 2 - 2.5,
      padding,
      size.width / 2 + 2.5,
      size.height - padding,
      const Radius.circular(borderRadius),
    );

    // رسم المستطيل الأفقي
    canvas.drawRRect(topLine, paint);

    // رسم المستطيل الرأسي
    canvas.drawRRect(leftLine, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
