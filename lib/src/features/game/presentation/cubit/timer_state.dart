part of 'timer_cubit.dart';

class TimerState {
  int duration;
  int? currentValue;
  TimerStatus? status;

  TimerState({
    required this.duration,
    this.currentValue,
    this.status,
  });

  TimerState copyWith({
    int? duration,
    int? currentValue,
    TimerStatus? status,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      currentValue: currentValue ?? this.currentValue,
      status: status ?? this.status,
    );
  }
}
