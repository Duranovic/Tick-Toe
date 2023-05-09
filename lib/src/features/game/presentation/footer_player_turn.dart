import 'package:flutter/material.dart';
import '../../../state/game_notifier.dart';
import '../../../state/timer_notifier.dart';
import '../domain/game.enum.dart';

class PlayerTurn extends StatefulWidget {
  const PlayerTurn({super.key});

  @override
  State<PlayerTurn> createState() => _PlayerTurnState();
}

class _PlayerTurnState extends State<PlayerTurn> {
  @override
  void initState() {
    timerNotifier.addListener(() {
      gameNotifier.changePlayerTurn();
      _updateComponent();
    });
    super.initState();
  }

  @override
  void dispose() {
    timerNotifier.removeListener(() {});
    super.dispose();
  }

  void _updateComponent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: const Color.fromARGB(255, 230, 230, 230)),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                color: (gameNotifier.value.playerTurn == Player.x)
                    ? const Color(0xff0972FF)
                    : Colors.white,
                child: Icon(
                  Icons.close_rounded,
                  color: (gameNotifier.value.playerTurn == Player.x)
                      ? Colors.white
                      : const Color(0xff0972FF),
                  size: 32,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                color: (gameNotifier.value.playerTurn == Player.o)
                    ? const Color(0xff09FFD6)
                    : Colors.white,
                child: Icon(
                  Icons.circle_outlined,
                  color: (gameNotifier.value.playerTurn == Player.o)
                      ? Colors.white
                      : const Color(0xff09FFD6),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
