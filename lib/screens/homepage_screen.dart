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
  Duration _duration = const Duration(minutes: 2);
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
      _isTimerFinished = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration -= const Duration(seconds: 1);
          _remainingTimePercentage =
              _duration.inSeconds / (_isShortBreak ? 60 : 120);
        });
      } else {
        if (!_isShortBreak) {
          // إذا انتهت فترة الـ 2 دقيقة، قم ببدء فترة الراحة القصيرة
          setState(() {
            _isTimerFinished = true;
            _isShortBreak = true;
            _duration =
                const Duration(minutes: 1); // تعيين الوقت الجديد إلى 1 دقيقة
            _remainingTimePercentage = _duration.inSeconds / 60;
          });
        } else {
          // إذا انتهت فترة الراحة القصيرة، قم بإعادة تعيين الوقت إلى 2 دقيقة
          setState(() {
            _isTimerFinished = false;
            _isShortBreak = false;
            _duration =
                const Duration(minutes: 2); // تعيين الوقت الجديد إلى 2 دقيقة
            _remainingTimePercentage = _duration.inSeconds / 120;
          });
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

    // تأكيد عدم بدء التايمر تلقائيًا عند تغيير الفترة الزمنية
    setState(() {
      _timerStarted = false; // تأكد من أن التايمر لم يبدأ بعد
      _isTimerFinished = false;
      _duration = _isShortBreak
          ? const Duration(minutes: 1)
          : const Duration(minutes: 2);
      _remainingTimePercentage = _isShortBreak ? 1.0 : 1.0;
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
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 75),
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
          if (!_isTimerFinished)
            const Padding(
              padding: EdgeInsets.all(34),
              child:
                  Bandora_Container(), // عرض Bandora_Container عندما الوقت لم ينته
            )
          else
            const Padding(
              padding: EdgeInsets.all(34),
              child: WinnerBandora(), // عرض WinnerBandora عندما ينتهي الوقت
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
