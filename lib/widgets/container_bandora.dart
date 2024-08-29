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
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: CustomPaint(
        painter: CrossLinesPainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(20, -30),
                  child: Visibility(
                    visible: words.contains('البندورة الثانية'),
                    child: const Text(
                      'البندورة الثانية',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'TheYear',
                          color: Color.fromRGBO(184, 184, 184, 60)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Transform.translate(
                  offset: const Offset(25, -30),
                  child: Visibility(
                    visible: words.contains('البندورة الاولى'),
                    child: const Text(
                      'البندورة الاولى',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'TheYear',
                          color: Color.fromRGBO(184, 184, 184, 60)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(20, 30),
                  child: Visibility(
                    visible: words.contains('البندورة الاخيرة'),
                    child: const Text(
                      'البندورة الاخيرة',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'TheYear',
                          color: Color.fromRGBO(184, 184, 184, 60)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Transform.translate(
                  offset: const Offset(20, 30),
                  child: Visibility(
                    visible: words.contains('البندورة الثالثة'),
                    child: const Text(
                      'البندورة الثالثة',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'TheYear',
                        color: Color.fromRGBO(184, 184, 184, 60),
                      ),
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
