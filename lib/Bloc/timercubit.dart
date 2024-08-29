import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerState {
  final Duration duration;
  final double remainingTimePercentage;
  final bool isTimerFinished;
  final bool isShortBreak;
  final bool showBigWinner;
  final int breaksCount;

  TimerState({
    required this.duration,
    required this.remainingTimePercentage,
    required this.isTimerFinished,
    required this.isShortBreak,
    required this.showBigWinner,
    required this.breaksCount,
  });

  factory TimerState.initial() {
    return TimerState(
      duration: const Duration(minutes: 25),
      remainingTimePercentage: 1.0,
      isTimerFinished: false,
      isShortBreak: false,
      showBigWinner: false,
      breaksCount: 0,
    );
  }

  TimerState copyWith({
    Duration? duration,
    double? remainingTimePercentage,
    bool? isTimerFinished,
    bool? isShortBreak,
    bool? showBigWinner,
    int? breaksCount,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      remainingTimePercentage:
          remainingTimePercentage ?? this.remainingTimePercentage,
      isTimerFinished: isTimerFinished ?? this.isTimerFinished,
      isShortBreak: isShortBreak ?? this.isShortBreak,
      showBigWinner: showBigWinner ?? this.showBigWinner,
      breaksCount: breaksCount ?? this.breaksCount,
    );
  }
}

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;

  TimerCubit() : super(TimerState.initial());

  void startTimer() {
    _timer?.cancel();

    emit(state.copyWith(
      isTimerFinished: false,
    ));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.duration.inSeconds > 0) {
        emit(state.copyWith(
          duration: state.duration - const Duration(seconds: 1),
          remainingTimePercentage:
              state.duration.inSeconds / (state.isShortBreak ? 300 : 1500),
        ));
      } else {
        _timer!.cancel();
        handleTimerFinish();
      }
    });
  }

  void handleTimerFinish() {
    if (state.showBigWinner) {
      emit(state.copyWith(
        showBigWinner: false,
        isShortBreak: false,
        duration: const Duration(minutes: 25),
        remainingTimePercentage: 1.0,
        isTimerFinished: true,
      ));
    } else if (!state.isShortBreak) {
      int newBreaksCount = state.breaksCount + 1;
      if (newBreaksCount % 4 == 0) {
        emit(state.copyWith(
          showBigWinner: true,
          duration: const Duration(minutes: 25),
          remainingTimePercentage: 1.0,
          isShortBreak: false,
        ));
      } else {
        emit(state.copyWith(
          isShortBreak: true,
          duration: const Duration(minutes: 5),
          remainingTimePercentage: 1.0,
        ));
      }
    } else {
      emit(state.copyWith(
        isShortBreak: false,
        duration: const Duration(minutes: 25),
        remainingTimePercentage: 1.0,
        isTimerFinished: true,
      ));
    }
  }

  void resetTimer() {
    _timer?.cancel();

    emit(state.copyWith(
      isTimerFinished: false,
      showBigWinner: false,
      duration: state.isShortBreak
          ? const Duration(minutes: 5)
          : const Duration(minutes: 25),
      remainingTimePercentage: 1.0,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
