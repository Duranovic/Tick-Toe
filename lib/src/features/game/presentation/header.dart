import 'package:flutter/material.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/timer_loading_bar.dart';
import '../../../state/game_notifier.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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
    return Flexible(
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
                color:
                    const Color.fromARGB(255, 225, 225, 225).withOpacity(0.7),
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
    );
  }
}
