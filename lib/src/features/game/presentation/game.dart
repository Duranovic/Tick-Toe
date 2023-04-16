import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                child: Row(children: [
                  Expanded(
                    child: Column(children: const [
                      Icon(
                        Icons.close_rounded,
                        color: Color(0xff0972FF),
                        size: 32,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1 wins',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff0972FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(children: const [
                      Icon(
                        Icons.circle_outlined,
                        color: Color(0xff09FFD6),
                        size: 32,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '2 wins',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff09FFD6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Column(children: const [
                      Icon(
                        Icons.handshake,
                        size: 32,
                        color: Color.fromARGB(255, 177, 177, 177),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '2 draws',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Color(0xff8D8D8D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  )
                ]),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              shrinkWrap: true,
              children: List.generate(9, (index) {
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
                    onPressed: () => {},
                    child: (index % 2 == 0)
                        ? const Icon(
                            Icons.close_rounded,
                            color: Color(0xff0972FF),
                            size: 48,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: Color(0xff09FFD6),
                            size: 48,
                          ),
                    // child: Text(
                    //   '$index',
                    //   style: const TextStyle(fontSize: 18),
                    // ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            flex: 3,
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
                              color: const Color.fromARGB(255, 214, 214, 214)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),
                              color: const Color(0xff0972FF),
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 10.0),
                              color: Colors.white,
                              child: const Icon(
                                Icons.circle_outlined,
                                color: Color(0xff09FFD6),
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
                          onPressed: () => {},
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
