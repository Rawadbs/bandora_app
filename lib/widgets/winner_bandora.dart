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
      ),
      child: Center(
        child: Column(
          children: [
            const Text('تستاهل بريك يا وحش'),
            Image.asset('assets/images/winner_bandora.png'),
          ],
        ),
      ),
    );
  }
}
