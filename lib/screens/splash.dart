import 'dart:async';
import 'package:bandora_app/screens/bandorais.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بدء المؤقت للانتقال إلى الشاشة الرئيسية بعد فترة محددة
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ExplaneBandora(),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
            ), // أضف هنا مسار صورة الشعار
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
