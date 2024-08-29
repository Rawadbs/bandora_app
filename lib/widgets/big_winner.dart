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
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Image.asset('assets/images/big_winner.png'),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '🥳 تستاهل بندورة كبيرة',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'TheYear',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
