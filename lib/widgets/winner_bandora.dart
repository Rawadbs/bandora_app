import 'package:flutter/material.dart';

class WinnerBandora extends StatelessWidget {
  const WinnerBandora({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 80),
        borderRadius: BorderRadius.all(Radius.circular(22)),
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
            Image.asset('assets/images/winner_bandora.png'),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '💪 تستاهل بريك يا وحش',
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
