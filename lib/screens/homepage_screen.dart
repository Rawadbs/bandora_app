import 'package:bandora_app/Bloc/timercubit.dart';
import 'package:flutter/material.dart';
import 'package:bandora_app/widgets/big_winner.dart';
import 'package:bandora_app/widgets/container_bandora.dart';
import 'package:bandora_app/widgets/draw.dart';
import 'package:bandora_app/widgets/winner_bandora.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // تأكد من إضافة هذا السطر

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  String formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = [
      'البندورة الاخيرة',
      'البندورة الثالثة',
      'البندورة الثانية',
      'البندورة الاولى',
    ];

    return BlocProvider(
      create: (_) => TimerCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xfff1f1f1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 34, right: 34, top: 150, bottom: 34),
                  child: Container(
                    height: 165,
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
                      child: Text(
                        formatDuration(state.duration),
                        style: const TextStyle(
                            fontSize: 96, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                int remainingWordsCount =
                    (4 - (state.breaksCount % 4)).clamp(0, 4);
                List<String> displayedWords =
                    words.sublist(0, remainingWordsCount);

                return Padding(
                  padding:
                      const EdgeInsets.only(left: 34, right: 34, bottom: 34),
                  child: state.showBigWinner
                      ? const BigWinnerBandora()
                      : (!state.isShortBreak
                          ? BandoraContainer(words: displayedWords)
                          : const WinnerBandora()),
                );
              },
            ),
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدائرة الكبيرة حول الزايد أو المربع
                    Container(
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                      ),
                    ),
                    // إظهار الزايد فقط إذا لم يكن التايمر قد بدأ
                    if (state.isTimerFinished)
                      InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () {
                          context.read<TimerCubit>().startTimer();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              painter: PizzaTimerPainter(
                                  state.remainingTimePercentage,
                                  state.isTimerFinished),
                              size: const Size(95, 95),
                            ),
                            const Icon(
                              Icons.add,
                              size: 60,
                              color: Color(
                                  0xffA6E22A), // يمكنك تعديل اللون حسب الرغبة
                            ),
                          ],
                        ),
                      ),

                    // إظهار المربع فقط عندما يكون التايمر نشطاً
                    if (!state.isTimerFinished)
                      InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: () {
                          context.read<TimerCubit>().pauseTimer();
                        },
                        onLongPress: () {
                          context.read<TimerCubit>().resetTimer();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              painter: PizzaTimerPainter(
                                  state.remainingTimePercentage,
                                  state.isTimerFinished),
                              size: const Size(95, 95),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xffCB463C),
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
