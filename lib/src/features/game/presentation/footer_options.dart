import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/timer_cubit.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/restart_game_dialog.dart';

class FooterOptions extends StatelessWidget {
  const FooterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final gameCubit = BlocProvider.of<GameCubit>(context);
    final timerCubit = BlocProvider.of<TimerCubit>(context);

    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 191, 191),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 217, 217, 217).withOpacity(0.8),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RestartGameDialog(
                        gameCubit: gameCubit,
                        timerCubit: timerCubit,
                      );
                    }),
              },
              icon: const Icon(Icons.refresh),
              iconSize: 36,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 32),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 191, 191),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 217, 217, 217).withOpacity(0.8),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () => {
                if (timerCubit.state.status == TimerStatus.running)
                  {
                    timerCubit.pauseTimer(),
                  }
                else
                  {
                    timerCubit.resumeTimer(),
                  }
              },
              icon: (timerCubit.state.status == TimerStatus.running)
                  ? const Icon(Icons.pause_rounded)
                  : const Icon(Icons.play_arrow_rounded),
              iconSize: 36,
              isSelected: true,
              selectedIcon: const Icon(Icons.pause),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 32),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 191, 191),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 217, 217, 217).withOpacity(0.8),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),
              iconSize: 36,
              color: Colors.white,
            ),
          ),
        ],
      );
    });
  }
}
