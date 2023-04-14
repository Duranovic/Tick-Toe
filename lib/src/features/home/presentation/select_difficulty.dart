import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectDifficulty extends StatelessWidget {
  const SelectDifficulty({super.key});

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
                  child: ElevatedButton(
                    onPressed: () => {context.go('/game')},
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
                    child: const Text("Easy"),
                  ),
                ),
                const SizedBox(height: 18),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(
                    onPressed: () => {context.go('/game')},
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
                    child: const Text("Medium"),
                  ),
                ),
                const SizedBox(height: 18),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(
                    onPressed: () => {context.go('/game')},
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
                    child: const Text("Hard"),
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
