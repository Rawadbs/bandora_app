import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bandora_app/Bloc/timercubit.dart';
import 'package:bandora_app/screens/bandorais.dart';
import 'package:bandora_app/screens/diffrent_bandora.dart';
import 'package:bandora_app/screens/homepage_screen.dart';
import 'package:bandora_app/screens/splash.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController nextPage = PageController();
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: Scaffold(
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              pageNumber = value;
              if (pageNumber == 3) {
                // Navigate to HomepageScreen and remove the onboarding stack from history
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomepageScreen(),
                  ),
                );
              }
            });
          },
          controller: nextPage,
          children: [
            SplashScreen(
              nextPage: nextPage,
              pagenumber: pageNumber,
            ),
            ExplaneBandora(
              nextPage: nextPage,
              pagenumber: pageNumber,
            ),
            DiffrentBandora(
              nextPage: nextPage,
              pagenumber: pageNumber,
            ),
            const HomepageScreen(),
          ],
        ),
      ),
    );
  }
}
