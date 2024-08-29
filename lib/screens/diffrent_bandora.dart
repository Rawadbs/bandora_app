import 'package:flutter/material.dart';

class DiffrentBandora extends StatelessWidget {
  const DiffrentBandora(
      {super.key, required this.nextPage, required this.pagenumber});
  final PageController nextPage;
  final int pagenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),

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
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                nextPage.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                width: 156,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffCB463C),
                ),
                child: const Center(
                  child: Text(
                    'هيا لنبدء  ',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontFamily: 'TheYear',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: i == pagenumber ? 25 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: i == pagenumber
                            ? const Color(0xffCB463C)
                            : Colors.grey),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
