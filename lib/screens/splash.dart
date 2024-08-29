import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final PageController nextPage;
  final int pagenumber;

  const SplashScreen(
      {required this.nextPage, required this.pagenumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
            ), // أضف هنا مسار صورة الشعار
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                nextPage.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                width: 114,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffCB463C),
                ),
                child: const Center(
                  child: Text(
                    'التالي',
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
