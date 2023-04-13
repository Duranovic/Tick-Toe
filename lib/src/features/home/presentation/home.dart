import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              child: Container(
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
                              onPressed: () => {context.go('/game')},
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
                                textStyle: const TextStyle(
                                    fontSize: 18, color: Colors.white),
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
              ),
            ),
          ],
        ));
  }
}
