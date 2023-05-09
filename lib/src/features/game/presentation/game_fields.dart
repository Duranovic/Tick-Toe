import 'package:flutter/material.dart';
import '../../../state/game_notifier.dart';
import '../domain/game.enum.dart';

class GameFields extends StatefulWidget {
  const GameFields({super.key});

  @override
  State<GameFields> createState() => _GameFieldsState();
}

class _GameFieldsState extends State<GameFields> {
  @override
  void initState() {
    gameNotifier.addListener(() {
      _updateComponent();
    });
    super.initState();
  }

  @override
  void dispose() {
    gameNotifier.removeListener(() {});
    super.dispose();
  }

  void _updateComponent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          int row = index ~/ 3;
          int col = index % 3;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () => {
                gameNotifier.playMove(row, col),
                _updateComponent(),
              },
              child: (gameNotifier.value.gameFields[row][col] == Player.x)
                  ? const Icon(
                      Icons.close_rounded,
                      color: Color(0xff0972FF),
                      size: 48,
                    )
                  : (gameNotifier.value.gameFields[row][col] == Player.o)
                      ? const Icon(
                          Icons.circle_outlined,
                          color: Color(0xff09FFD6),
                          size: 48,
                        )
                      : Container(),
            ),
          );
        },
      ),
    );
  }
}
