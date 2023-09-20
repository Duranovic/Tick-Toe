import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/game.enum.dart';
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit(TimerState initialValue) : super(initialValue);

  void startTimer() {
    updateTimerState(TimerStatus.running);
  }

  void pauseTimer() {
    updateTimerState(TimerStatus.paused);
  }

  void resumeTimer() {
    updateTimerState(TimerStatus.running);
  }

  void timerCompleted() {
    updateTimerState(TimerStatus.completed);
  }

  void resetTimer() {
    updateTimerState(TimerStatus.restarted);
    updateTimerState(TimerStatus.running);
  }

  void setMissedMoveTime() {
    emit(state.copyWith(
      missedMoveDuration: state.duration ~/ 2,
    ));
  }

  void resetMissedMoveTime() {
    emit(state.copyWith(
      missedMoveDuration: 0,
    ));
  }

  void updateTimerState(newStatus) {
    emit(state.copyWith(
      status: newStatus,
    ));
  }
}
