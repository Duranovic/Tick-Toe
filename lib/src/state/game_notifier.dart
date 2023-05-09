import 'package:flutter/cupertino.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.model.dart';
import 'package:tick_toe_flutter/src/state/timer_notifier.dart';
import 'package:tick_toe_flutter/src/state/wins_notifier.dart';

class GameNotifier extends ValueNotifier<GameState> {
  GameNotifier(GameState value) : super(value);

  void playMove(int row, int column) {
    if (value.gameFields[row][column] == null) {
      value.gameFields[row][column] = value.playerTurn;
      check();
      timerNotifier.restartTimer();
      notifyListeners();
    }
  }

  void check() {
    for (int i = 0; i < 3; i++) {
      if (value.gameFields[i][0] == value.gameFields[i][1] &&
          value.gameFields[i][1] == value.gameFields[i][2] &&
          value.gameFields[i][0] != null) {
        // There is a winner in this row
        incrementWins();
      }
    }

    for (int i = 0; i < 3; i++) {
      if (value.gameFields[0][i] == value.gameFields[1][i] &&
          value.gameFields[1][i] == value.gameFields[2][i] &&
          value.gameFields[0][i] != null) {
        // There is a winner in this column
        incrementWins();
      }
    }

    if (value.gameFields[0][0] == value.gameFields[1][1] &&
        value.gameFields[1][1] == value.gameFields[2][2] &&
        value.gameFields[0][0] != null) {
      // There is a winner in the top-left to bottom-right diagonal
      incrementWins();
    }

    if (value.gameFields[0][2] == value.gameFields[1][1] &&
        value.gameFields[1][1] == value.gameFields[2][0] &&
        value.gameFields[0][2] != null) {
      // There is a winner in the top-right to bottom-left diagonal
      incrementWins();
    }
  }

  void incrementWins() {
    if (value.playerTurn == Player.x) {
      value.tickWins++;
    } else {
      value.toeWins++;
    }

    value.newGame();
    checkWinner();
  }

  void changePlayerTurn() {
    value.playerTurn = (value.playerTurn == Player.x ? Player.o : Player.x);
    notifyListeners();
  }

  void checkWinner() {
    if (value.tickWins == 3) {
      print("TICK WINS");
      resetGame();
      winsNotifier.value = Player.x;
    } else if (value.toeWins == 3) {
      print("TOE WINS");
      winsNotifier.value = Player.o;
      resetGame();
    } else if (value.tickWins + value.toeWins + value.draws == 3) {
      winsNotifier.value = null;
      print("DRAW");
    }
  }

  void resetGame() {
    value = GameState();
    timerNotifier.restartTimer();
    notifyListeners();
  }
}

final gameNotifier = GameNotifier(GameState());
