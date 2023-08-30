part of 'game_cubit.dart';

class GameState {
  List<List<Player?>> gameFields;
  Player playerTurn;
  int tickWins;
  int toeWins;
  int draws;
  double timerValue;

  GameState({
    required this.gameFields,
    required this.playerTurn,
    required this.tickWins,
    required this.toeWins,
    required this.draws,
    required this.timerValue,
  });

  GameState copyWith({
    List<List<Player?>>? gameFields,
    Player? playerTurn,
    int? tickWins,
    int? toeWins,
    int? draws,
    double? timerValue,
  }) {
    return GameState(
      gameFields: gameFields ?? this.gameFields,
      playerTurn: playerTurn ?? this.playerTurn,
      tickWins: tickWins ?? this.tickWins,
      toeWins: toeWins ?? this.toeWins,
      draws: draws ?? this.draws,
      timerValue: timerValue ?? this.timerValue,
    );
  }
}
