import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/game_cubit.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/timer_loading_bar.dart';

import 'cubit/timer_cubit.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final TimerCubit timerCubit = BlocProvider.of<TimerCubit>(context);
    final GameCubit gameCubit = BlocProvider.of<GameCubit>(context);

    return BlocBuilder<GameCubit, GameState>(builder: (context, state) {
      return Flexible(
        flex: 3,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 225, 225, 225).withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Expanded(
                    child: Column(children: [
                      const Icon(
                        Icons.close_rounded,
                        color: Color(0xff0972FF),
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${state.tickWins} wins",
                        style: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff0972FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      const Icon(
                        Icons.circle_outlined,
                        color: Color(0xff09FFD6),
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${state.toeWins} wins",
                        style: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff09FFD6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      const Icon(
                        Icons.handshake,
                        size: 32,
                        color: Color.fromARGB(255, 177, 177, 177),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${state.draws} draws",
                        style: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff8D8D8D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  )
                ]),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: Color.fromARGB(255, 193, 193, 193),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TimerLoadingBar(
                          timerCubit: timerCubit,
                          gameCubit: gameCubit,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
