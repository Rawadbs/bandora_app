import 'package:bandora_app/Bloc/timercubit.dart';
import 'package:bandora_app/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(), // إنشاء TimerCubit
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomepageScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
