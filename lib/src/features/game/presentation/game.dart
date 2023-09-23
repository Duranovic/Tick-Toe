import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/end_game_dialog.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/end_of_round.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_options.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_player_turn.dart';
import '../../../shared/presentation/loading_popup_w_content.dart';
import '../domain/game.enum.dart';
import 'cubit/game_cubit.dart';
import 'cubit/timer_cubit.dart';
import 'game_fields.dart';
import 'header.dart';

class Game extends StatefulWidget {
  Game({super.key});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameCubit gameCubit = GameCubit();
  final TimerCubit timerCubit = TimerCubit(
    TimerState(
      duration: 5,
    ),
  );

  @override
  void initState() {
    super.initState();

    gameCubit.stream.listen(
      (state) {
        if (state.roundWinner != null) {
          timerCubit.pauseTimer();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return LoadingPopupWContent(
                contentWidget: EndOfRound(
                  winner: state.roundWinner ?? Winner.draw,
                ),
              );
            },
          ).whenComplete(
              () => {gameCubit.resetGame(), timerCubit.resetTimer()});
        }

        if (state.gameWinner != null) {
          timerCubit.pauseTimer();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return EndGameDialog(
                gameCubit: gameCubit,
              );
            },
          ).whenComplete(
              () => {gameCubit.restartGame(), timerCubit.resetTimer()});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<GameCubit>.value(value: gameCubit),
        BlocProvider<TimerCubit>.value(value: timerCubit),
      ],
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Header(),
            const SizedBox(height: 30),
            const GameFields(),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    PlayerTurn(),
                    FooterOptions(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    gameCubit.close();
    timerCubit.close();
    super.dispose();
  }
}
