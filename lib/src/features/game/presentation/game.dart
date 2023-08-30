import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_options.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_player_turn.dart';
import 'cubit/game_cubit.dart';
import 'cubit/timer_cubit.dart';
import 'game_fields.dart';
import 'header.dart';

class Game extends StatelessWidget {
  Game({super.key});

  final GameCubit gameCubit = GameCubit();
  final TimerCubit timerCubit = TimerCubit(
    TimerState(
      duration: 5,
    ),
  );

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
}
