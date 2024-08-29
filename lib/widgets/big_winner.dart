import 'package:flutter/material.dart';

class BigWinnerBandora extends StatelessWidget {
  const BigWinnerBandora({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 80),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Image.asset('assets/images/winner_bandora.png'),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '🥳 تستاهل باندورة كبيرة',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
