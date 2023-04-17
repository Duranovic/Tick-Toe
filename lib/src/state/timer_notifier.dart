import 'package:flutter/cupertino.dart';

class TimerNotifier extends ValueNotifier<bool> {
  TimerNotifier(bool value) : super(value);

  void restartTimer() {
    value = true;
    notifyListeners();
  }
}

final timerNotifier = TimerNotifier(false);
