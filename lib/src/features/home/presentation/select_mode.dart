import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/home/domain/pre_game.enums.dart';
import 'package:tick_toe_flutter/src/state/pre_game_notifier.dart';

class SelectMode extends StatelessWidget {
  const SelectMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9FDFF),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(40),
            child: const Text(
              "Please select a mode you want to play",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 34, 34, 34)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton.icon(
                    onPressed: () => {
                      preGameNotifier.setGameStep(GameStep.selectDifficulty),
                      preGameNotifier.setGameMode(GameMode.singleplayer)
                    },
                    icon: const Icon(Icons.person),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0972FF),
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: const Text("Singleplayer"),
                  ),
                ),
                const SizedBox(height: 18),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.group),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle:
                          const TextStyle(fontSize: 18, color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: const Text("Multiplayer"),
                  ),
                ),
                const SizedBox(height: 18),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.bluetooth_searching,
                        color: Colors.black),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: const Text(
                      "Multiplayer",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
