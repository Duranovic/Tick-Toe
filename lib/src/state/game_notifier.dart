import 'package:flutter/cupertino.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.model.dart';
import 'package:tick_toe_flutter/src/state/timer_notifier.dart';

class GameNotifier extends ValueNotifier<GameState> {
  GameNotifier(GameState value) : super(value);

  void incrementDraws() {
    value.draws++;
    notifyListeners();
  }

  void incrementTickWins() {
    value.tickWins++;
    notifyListeners();
  }

  void incrementToeWins() {
    value.toeWins++;
    notifyListeners();
  }

  void playMove(int index) {
    if (value.gameFields[index] == null) {
      value.gameFields[index] = value.playerTurn;
      timerNotifier.restartTimer();
      notifyListeners();
    }
  }

  void changePlayerTurn() {
    value.playerTurn = (value.playerTurn == Player.x ? Player.o : Player.x);
    notifyListeners();
  }

  void resetGame() {
    value = GameState();
    timerNotifier.restartTimer();
    notifyListeners();
  }
}

final gameNotifier = GameNotifier(GameState());
