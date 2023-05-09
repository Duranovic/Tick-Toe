import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/end_game_dialog.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_options.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/footer_player_turn.dart';
import 'package:tick_toe_flutter/src/state/wins_notifier.dart';
import 'game_fields.dart';
import 'header.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();

    winsNotifier.addListener(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const EndGameDialog();
          });
    });
  }

  @override
  void dispose() {
    winsNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
