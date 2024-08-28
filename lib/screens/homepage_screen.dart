import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bandora_app/widgets/container_bandora.dart';
import 'package:bandora_app/widgets/draw.dart';
import 'package:bandora_app/widgets/winner_bandora.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  Duration _duration = const Duration(minutes: 25);
  Timer? _timer;
  double _remainingTimePercentage = 1.0;
  bool _isTimerFinished = false;
  bool _isShortBreak = false;
  bool _timerStarted = false;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _timerStarted = true;
      _isTimerFinished = false; // إعادة تعيين حالة انتهاء التايمر عند البدء
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration -= const Duration(seconds: 1);
          _remainingTimePercentage =
              _duration.inSeconds / (_isShortBreak ? 300 : 1500);
        });
      } else {
        _timer!.cancel(); // إلغاء التايمر عند انتهاء الوقت
        setState(() {
          _isTimerFinished = true; // تحديث حالة انتهاء التايمر
          _timerStarted = false; // تعيين أن التايمر لم يعد قيد التشغيل
        });

        if (!_isShortBreak) {
          _isShortBreak = true;
          _duration = const Duration(minutes: 5);
          _remainingTimePercentage = 1.0;
        } else {
          _isShortBreak = false;
          _duration = const Duration(minutes: 25);
          _remainingTimePercentage = 1.0;
        }
      }
    });
  }

  void handleStartButton() {
    if (!_timerStarted) {
      startTimer(); // ابدأ التايمر فقط عند الضغط على الزر
    }
  }

  void resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _timerStarted = false;
      _isTimerFinished = false;
      _duration = _isShortBreak
          ? const Duration(minutes: 5)
          : const Duration(minutes: 25);
      _remainingTimePercentage = 1.0;
    });
  }

  String formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 34, right: 34, top: 150, bottom: 34),
            child: Container(
              height: 165,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 80),
              ),
              child: Center(
                child: Text(
                  formatDuration(_duration),
                  style: const TextStyle(
                      fontSize: 96, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // عرض الودجت بناءً على حالة التايمر وفترة العمل/الاستراحة
          Padding(
            padding: const EdgeInsets.only(left: 34, right: 34, bottom: 34),
            child: !_isShortBreak
                ? const Bandora_Container() // عرض WinnerBandora خلال فترة الدقيقة (الاستراحة القصيرة)
                : const WinnerBandora(), // عرض Bandora_Container خلال فترة الدقيقتين (العمل)
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              // دائرة خارجية ثابتة بيضاء مع خطوط حمراء
              Container(
                width: 115, // حجم أكبر من الدائرة المتقلصة
                height: 115,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 10, // سمك حدود الدائرة الخارجية
                  ),
                ),
              ),
              // رسم الدائرة المتقلصة بتطبيق CustomPaint
              CustomPaint(
                painter: PizzaTimerPainter(
                    _remainingTimePercentage, _isTimerFinished),
                size: const Size(95, 95),
              ),
              // المربع في المنتصف
              GestureDetector(
                onTap: handleStartButton,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffCB463C),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
