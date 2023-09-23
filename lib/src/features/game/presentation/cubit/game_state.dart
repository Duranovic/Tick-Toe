part of 'game_cubit.dart';

class GameState {
  List<List<Player?>> gameFields;
  Player playerTurn;
  int tickWins;
  int toeWins;
  int draws;
  double timerValue;
  Winner? winner;

  GameState({
    required this.gameFields,
    required this.playerTurn,
    required this.tickWins,
    required this.toeWins,
    required this.draws,
    required this.timerValue,
    this.winner,
  });

  GameState copyWith({
    List<List<Player?>>? gameFields,
    Winner? winner,
    Player? playerTurn,
    int? tickWins,
    int? toeWins,
    int? draws,
    double? timerValue,
  }) {
    return GameState(
      gameFields: gameFields ?? this.gameFields,
      winner: winner,
      playerTurn: playerTurn ?? this.playerTurn,
      tickWins: tickWins ?? this.tickWins,
      toeWins: toeWins ?? this.toeWins,
      draws: draws ?? this.draws,
      timerValue: timerValue ?? this.timerValue,
    );
  }
}
