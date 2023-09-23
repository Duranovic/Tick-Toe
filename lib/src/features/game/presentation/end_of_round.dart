import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';

class EndOfRound extends StatelessWidget {
  final Winner winner;
  const EndOfRound({super.key, required this.winner});

  Icon getWinnerIcon() {
    if (winner == Winner.x) {
      return const Icon(
        Icons.close,
        size: 40,
        weight: 10,
        color: Color(0xff0972FF),
      );
    } else if (winner == Winner.o) {
      return const Icon(
        Icons.circle_outlined,
        size: 40,
        color: Color(0xff09FFD6),
      );
    }
    return const Icon(
      Icons.handshake,
      size: 35,
      color: Color.fromARGB(255, 177, 177, 177),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 30,
          child: Text(
            winner == Winner.draw ? "IT'S A DRAW" : 'WON THE ROUND',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Positioned(
          top: -50,
          child: Container(
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: getWinnerIcon(),
          ),
        ),
      ],
    );
  }
}
