import 'game.enum.dart';

class GameState {
  late List<List<Player?>> gameFields;
  late Player playerTurn;
  late int tickWins;
  late int toeWins;
  late int draws;
  late double timerValue;

  GameState() {
    gameFields = List.generate(3, (_) => List.generate(3, (_) => null));
    playerTurn = Player.x;
    tickWins = 0;
    toeWins = 0;
    draws = 0;
    timerValue = 0;
  }

  newGame() {
    gameFields = List.generate(3, (_) => List.generate(3, (_) => null));
    timerValue = 0;
  }
}
