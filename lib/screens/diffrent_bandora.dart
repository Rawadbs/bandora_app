import 'dart:async';

import 'package:bandora_app/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

class DiffrentBandora extends StatelessWidget {
  const DiffrentBandora({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 15), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomepageScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/images/4tomato.png'),
                Image.asset('assets/images/equivlant.png'),
                Image.asset('assets/images/winner_bandora.png'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '! فكرة التطبيق ',
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
                    text: '= 🍅',
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
                    text: ' 🍅 صغيرة =',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '  بريك لمدة 5 دقائق',
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
                    text: ' 🍅 كبيرة =',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '  بريك لمدة 25 دقيقة',
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
                    text: '4 🍅',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'TheYear',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' =  🍅 كبيرة',
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
