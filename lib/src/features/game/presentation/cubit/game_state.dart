part of 'game_cubit.dart';

class GameState {
  List<List<Player?>> gameFields;
  Player playerTurn;
  int tickWins;
  int toeWins;
  int draws;
  double timerValue;
  int numberOfRounds;
  int currentRound = 1;
  Winner? roundWinner;
  Winner? gameWinner;

  GameState({
    required this.gameFields,
    required this.playerTurn,
    required this.tickWins,
    required this.toeWins,
    required this.draws,
    required this.timerValue,
    required this.numberOfRounds,
    this.currentRound = 1,
    this.roundWinner,
    this.gameWinner,
  });

  GameState copyWith({
    List<List<Player?>>? gameFields,
    Winner? roundWinner,
    Winner? gameWinner,
    Player? playerTurn,
    int? tickWins,
    int? toeWins,
    int? draws,
    double? timerValue,
    int? currentRound,
    int? numberOfRounds,
  }) {
    return GameState(
      gameFields: gameFields ?? this.gameFields,
      roundWinner: roundWinner,
      gameWinner: gameWinner,
      playerTurn: playerTurn ?? this.playerTurn,
      tickWins: tickWins ?? this.tickWins,
      toeWins: toeWins ?? this.toeWins,
      draws: draws ?? this.draws,
      timerValue: timerValue ?? this.timerValue,
      currentRound: currentRound ?? this.currentRound,
      numberOfRounds: numberOfRounds ?? this.numberOfRounds,
    );
  }
}
