part of 'timer_cubit.dart';

class TimerState {
  int duration;
  int missedMoveDuration;
  int? currentValue;
  TimerStatus? status;

  TimerState({
    required this.duration,
    this.missedMoveDuration = 0,
    this.currentValue,
    this.status,
  });

  TimerState copyWith({
    int? duration,
    int? missedMoveDuration,
    int? currentValue,
    TimerStatus? status,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      missedMoveDuration: missedMoveDuration ?? this.missedMoveDuration,
      currentValue: currentValue ?? this.currentValue,
      status: status ?? this.status,
    );
  }
}
