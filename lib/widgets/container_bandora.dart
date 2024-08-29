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
              children: [
                Transform.translate(
                  offset: const Offset(80, 0),
                  child: Visibility(
                    visible: words.contains('البندورة الثانية'),
                    child: const Text(
                      'البندورة\n الثانية',
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
                  offset: const Offset(80, 0),
                  child: Visibility(
                    visible: words.contains('البندورة الاولى'),
                    child: const Text(
                      'البندورة \n الاولى',
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
                  offset: const Offset(80, 0),
                  child: Visibility(
                    visible: words.contains('البندورة الاخيرة'),
                    child: const Text(
                      'البندورة\n الاخيرة',
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
                  offset: const Offset(80, 0),
                  child: Visibility(
                    visible: words.contains('البندورة الثالثة'),
                    child: const Text(
                      'البندورة \n الثالثة',
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
