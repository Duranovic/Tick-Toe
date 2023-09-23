import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/domain/button_variations.dart';
import '../../../shared/presentation/button.dart';
import '../domain/game.enum.dart';
import 'cubit/game_cubit.dart';

class EndGameDialog extends StatefulWidget {
  final GameCubit gameCubit;

  const EndGameDialog({super.key, required this.gameCubit});

  @override
  _EndGameDialogState createState() => _EndGameDialogState();
}

class _EndGameDialogState extends State<EndGameDialog> {
  String getWinnerIcon() {
    if (widget.gameCubit.state.gameWinner == Winner.x) {
      return 'assets/images/x.svg';
    } else if (widget.gameCubit.state.gameWinner == Winner.o) {
      return 'assets/images/o.svg';
    }

    return 'assets/images/draw.svg';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // The transparent white background
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        // The dialog box
        AlertDialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor:
              Colors.white.withOpacity(0), // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    getWinnerIcon(),
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'IS A WINNER',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(children: [
                Expanded(
                  child: Row(children: [
                    const Icon(
                      Icons.close_rounded,
                      color: Color(0xff0972FF),
                      size: 32,
                    ),
                    Text(
                      "${widget.gameCubit.state.tickWins} wins",
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: Color(0xff0972FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(children: [
                    const Icon(
                      Icons.circle_outlined,
                      color: Color(0xff09FFD6),
                      size: 32,
                    ),
                    Text(
                      "${widget.gameCubit.state.toeWins} wins",
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: Color(0xff09FFD6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(children: [
                    const Icon(
                      Icons.handshake,
                      size: 32,
                      color: Color.fromARGB(255, 177, 177, 177),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${widget.gameCubit.state.draws} draws",
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
              const SizedBox(height: 80),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    text: "PLAY NEW GAME",
                    onPressed: () => {
                      Navigator.of(context).pop(),
                    },
                  ),
                  const SizedBox(height: 15),
                  Button(
                    text: "BACK TO HOME",
                    variant: Variant.secondary,
                    onPressed: () => {
                      context.go('/'),
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}


//  Navigator.of(context).pop();