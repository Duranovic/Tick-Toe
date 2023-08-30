import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/cubit/timer_cubit.dart';
import 'cubit/game_cubit.dart';

class RestartGameDialog extends StatelessWidget {
  final GameCubit gameCubit;
  final TimerCubit timerCubit;

  const RestartGameDialog(
      {super.key, required this.gameCubit, required this.timerCubit});

  @override
  Widget build(BuildContext context) {
    timerCubit.pauseTimer();

    return Stack(
      alignment: Alignment.center,
      children: [
        // The transparent white background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color:
                  Colors.white.withOpacity(0.8), // Adjust the opacity as needed
            ),
          ),
        ),
        // The dialog box
        AlertDialog(
          alignment: Alignment.center,
          backgroundColor:
              Colors.transparent, // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Are you sure you want to restart the game?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      backgroundColor: const Color(0xff0972FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      gameCubit.restartGame();
                      timerCubit.resetTimer();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes. restart the game!'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    backgroundColor: const Color(0xffFF096B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    timerCubit.resumeTimer();
                  },
                  child: const Text('Nope. I wanna continue!'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
