import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/domain/game.enum.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/end_game_dialog.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/restart_game_dialog.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/timer_loading_bar.dart';
import 'package:tick_toe_flutter/src/state/game_notifier.dart';
import 'package:tick_toe_flutter/src/state/wins_notifier.dart';
import '../../../state/timer_notifier.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();
    timerNotifier.addListener(() {
      gameNotifier.changePlayerTurn();
      _updateComponent();
    });
    winsNotifier.addListener(() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const EndGameDialog();
          });
      print("TEST");
    });
  }

  @override
  void dispose() {
    timerNotifier.removeListener(() {});
    winsNotifier.removeListener(() {});
    super.dispose();
  }

  void _updateComponent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
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
                      color: const Color.fromARGB(255, 225, 225, 225)
                          .withOpacity(0.7),
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
                            "${gameNotifier.value.tickWins} wins",
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
                            "${gameNotifier.value.toeWins} wins",
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
                            "${gameNotifier.value.draws} draws",
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
                            child: TimerLoadingBar(duration: 10),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          FractionallySizedBox(
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
                        color: const Color.fromARGB(255, 225, 225, 225)
                            .withOpacity(0.7),
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
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: const Color.fromARGB(255, 230, 230, 230)),
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),
                              color: (gameNotifier.value.playerTurn == Player.x)
                                  ? const Color(0xff0972FF)
                                  : Colors.white,
                              child: Icon(
                                Icons.close_rounded,
                                color:
                                    (gameNotifier.value.playerTurn == Player.x)
                                        ? Colors.white
                                        : const Color(0xff0972FF),
                                size: 32,
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),
                              color: (gameNotifier.value.playerTurn == Player.o)
                                  ? const Color(0xff09FFD6)
                                  : Colors.white,
                              child: Icon(
                                Icons.circle_outlined,
                                color:
                                    (gameNotifier.value.playerTurn == Player.o)
                                        ? Colors.white
                                        : const Color(0xff09FFD6),
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 191, 191, 191),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 217, 217, 217)
                                  .withOpacity(0.8),
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
                                  return const RestartGameDialog();
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
                              color: const Color.fromARGB(255, 217, 217, 217)
                                  .withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.play_arrow_rounded),
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
                              color: const Color.fromARGB(255, 217, 217, 217)
                                  .withOpacity(0.8),
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
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
