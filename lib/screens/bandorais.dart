import 'dart:async';

import 'package:bandora_app/screens/diffrent_bandora.dart';
import 'package:flutter/material.dart';

class ExplaneBandora extends StatelessWidget {
  const ExplaneBandora({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const DiffrentBandora(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mixer.png'),
            const SizedBox(height: 20),
            const Text(
              '! مؤقت بندورة',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'TheYear',
              ),
            ),
            const SizedBox(height: 20), // إضافة مسافة بين النصوص
            RichText(
              textDirection: TextDirection.rtl,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '25 دقيقة ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'تعمل فيها مهمة صغيرة',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              textDirection: TextDirection.rtl,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'عند الانتهاء من المهمة ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'تحصل على بريك لمدة 5 دقائق',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              textDirection: TextDirection.rtl,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'عند الانتهاء من جميع المهمات ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'تحصل على بريك لمدة 25 دقيقة',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
