import 'game.enum.dart';

class GameState {
  late List<Player?> gameFields;
  late Player playerTurn;
  late int tickWins;
  late int toeWins;
  late int draws;
  late double timerValue;

  GameState() {
    gameFields = List.filled(9, null);
    playerTurn = Player.x;
    tickWins = 0;
    toeWins = 0;
    draws = 0;
    timerValue = 0;
  }
}
