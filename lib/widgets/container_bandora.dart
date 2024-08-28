import 'package:bandora_app/widgets/draw.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Bandora_Container extends StatelessWidget {
  const Bandora_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 80),
      ),
      child: CustomPaint(
        painter: CrossLinesPainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: const Text(
                    'البندورة الثانية',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: const Text(
                    'البندورة الاولى',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, 30),
                  child: const Text(
                    'البندورة الاخيرة',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 30),
                  child: const Text(
                    'البندورة الثالثة',
                    style: TextStyle(
                      fontSize: 22,
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
