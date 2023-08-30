import 'package:bloc/bloc.dart';
import '../../domain/game.enum.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(
          GameState(
            gameFields: [], // Provide initial value for gameFields
            playerTurn: Player.x, // Provide initial value for playerTurn
            tickWins: 0, // Provide initial value for tickWins
            toeWins: 0, // Provide initial value for toeWins
            draws: 0, // Provide initial value for draws
            timerValue: 0, // Provide initial value for timerValue
          ),
        ) {
    // Initialize the game state
    state.gameFields = List.generate(3, (_) => List.generate(3, (_) => null));
  }

  // Define methods to update the game state
  void makeMove(int row, int col) {
    // Create a new instance of gameFields with the updated value
    final newGameFields = List<List<Player?>>.from(state.gameFields);
    newGameFields[row][col] = state.playerTurn;

    // Update other necessary state properties
    final newPlayerTurn = state.playerTurn == Player.x ? Player.o : Player.x;

    // Implement the logic for checking wins, draws, and other game rules
    final isDraw = GameCubit.isDraw(newGameFields);

    if (isDraw) {
      state.draws++;
      return resetGame();
    }

    final winner = checkWinner(newGameFields);
    if (winner == Player.x) {
      state.tickWins++;
      return resetGame();
    } else if (winner == Player.o) {
      state.toeWins++;
      return resetGame();
    }

    // Create a new instance of the GameState with the updated values
    final newState = state.copyWith(
      gameFields: newGameFields,
      playerTurn: newPlayerTurn,
    );
    // Emit the updated state
    emit(newState);
  }

  void resetGame() {
    // Reset the game state to its initial values
    final newState = state.copyWith(
      gameFields: List.generate(3, (_) => List.generate(3, (_) => null)),
      playerTurn: Player.x,
      timerValue: 0.0,
    );

    // Emit the updated state
    emit(newState);
  }

  void restartGame() {
    // Reset the game state to its initial values
    final newState = state.copyWith(
      gameFields: List.generate(3, (_) => List.generate(3, (_) => null)),
      playerTurn: Player.x,
      tickWins: 0,
      draws: 0,
      toeWins: 0,
    );

    // Emit the updated state
    emit(newState);
  }

  static Player? checkWinner(List<List<Player?>> board) {
    // Check rows, columns, and diagonals for a win
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != null &&
          board[i][0] == board[i][1] &&
          board[i][0] == board[i][2]) {
        return board[i][0];
      }
      if (board[0][i] != null &&
          board[0][i] == board[1][i] &&
          board[0][i] == board[2][i]) {
        return board[0][i];
      }
    }

    if (board[0][0] != null &&
        board[0][0] == board[1][1] &&
        board[0][0] == board[2][2]) {
      return board[0][0];
    }

    if (board[0][2] != null &&
        board[0][2] == board[1][1] &&
        board[0][2] == board[2][0]) {
      return board[0][2];
    }

    return null; // No winner
  }

  static bool isDraw(List<List<Player?>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == null) {
          return false; // There are empty cells, game is not a draw
        }
      }
    }
    return true; // All cells are filled, game is a draw
  }
}
