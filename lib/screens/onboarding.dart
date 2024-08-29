import 'package:bandora_app/screens/bandorais.dart';
import 'package:bandora_app/screens/diffrent_bandora.dart';
import 'package:bandora_app/screens/homepage_screen.dart';
import 'package:bandora_app/screens/splash.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController nextpage = PageController();
  int pagenumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pagenumber = value;
          });
        },
        controller: nextpage,
        children: [
          SplashScreen(
            nextPage: nextpage,
            pagenumber: pagenumber,
          ),
          ExplaneBandora(
            nextPage: nextpage,
            pagenumber: pagenumber,
          ),
          DiffrentBandora(
            nextPage: nextpage,
            pagenumber: pagenumber,
          ),
          const HomepageScreen(),
        ],
      ),
    );
  }
}
