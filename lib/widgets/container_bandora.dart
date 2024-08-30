import 'package:flutter/material.dart';
import 'package:bandora_app/widgets/draw.dart';

class BandoraContainer extends StatelessWidget {
  final List<String> words; // النصوص المعروضة

  const BandoraContainer({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 80),
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(15, 0, 0, 0),
            blurRadius: 30,
          ),
        ],
      ),
      child: CustomPaint(
        painter: CrossLinesPainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: words.contains('البندورة الثانية'),
                  replacement: Image.asset(
                    'assets/images/winner_bandora.png', // استبدل your_image.png بمسار الصورة الخاص بك
                    width: 50,
                    height: 50,
                  ),
                  child: const Text(
                    'البندورة\n الثانية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'TheYear',
                        color: Color.fromRGBO(184, 184, 184, 60)),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Visibility(
                  visible: words.contains('البندورة الاولى'),
                  replacement: Image.asset(
                    'assets/images/winner_bandora.png', // استبدل your_image.png بمسار الصورة الخاص بك
                    width: 50,
                    height: 50,
                  ),
                  child: const Text(
                    'البندورة \n الاولى',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'TheYear',
                        color: Color.fromRGBO(184, 184, 184, 60)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: words.contains('البندورة الاخيرة'),
                  replacement: Image.asset(
                    'assets/images/winner_bandora.png', // استبدل your_image.png بمسار الصورة الخاص بك
                    width: 50,
                    height: 50,
                  ),
                  child: const Text(
                    'البندورة\n الاخيرة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'TheYear',
                        color: Color.fromRGBO(184, 184, 184, 60)),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Visibility(
                  visible: words.contains('البندورة الثالثة'),
                  replacement: Image.asset(
                    'assets/images/winner_bandora.png', // استبدل your_image.png بمسار الصورة الخاص بك
                    width: 50,
                    height: 50,
                  ),
                  child: const Text(
                    'البندورة \n الثالثة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'TheYear',
                      color: Color.fromRGBO(184, 184, 184, 60),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
