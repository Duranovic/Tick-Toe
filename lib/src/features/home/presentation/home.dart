import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/home/domain/pre_game.enums.dart';
import 'package:tick_toe_flutter/src/features/home/presentation/select_difficulty.dart';
import 'package:tick_toe_flutter/src/features/home/presentation/select_mode.dart';
import 'package:tick_toe_flutter/src/state/pre_game_notifier.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    preGameNotifier.addListener(_onMyValueNotifierChanged);
  }

  @override
  void dispose() {
    preGameNotifier.removeListener(_onMyValueNotifierChanged);
    super.dispose();
  }

  void _onMyValueNotifierChanged() {
    setState(() {
      // Rebuild the widget when the name property changes.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color(0xff001231),
                    child: Stack(
                      children: [
                        Positioned(
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomCenter,
                            heightFactor: 1,
                            widthFactor: 0.7,
                            child: Image.asset('assets/images/hero.png'),
                          ),
                        ),
                        const Positioned(
                          bottom: -10,
                          left: 0,
                          right: 0,
                          child: Text(
                            "TICK TOE",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontFamily: 'TiltWarp',
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              flex: 1,
              child: preGameNotifier.value.gameStep == GameStep.selectGameMode
                  ? const SelectMode()
                  : const SelectDifficulty(),
            ),
          ],
        ));
  }
}
