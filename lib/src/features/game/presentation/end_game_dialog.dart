import 'dart:async';
import 'package:flutter/material.dart';

class EndGameDialog extends StatefulWidget {
  const EndGameDialog({super.key});

  @override
  _EndGameDialogState createState() => _EndGameDialogState();
}

class _EndGameDialogState extends State<EndGameDialog> {
  int waitingTimeForRound = 5;
  late Timer roundTimer;

  @override
  void initState() {
    super.initState();
    roundTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (waitingTimeForRound > 0) {
        setState(() {
          waitingTimeForRound--;
        });
      } else {
        roundTimer.cancel();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // The transparent white background
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1), // Adjust the opacity as needed
          ),
        ),
        // The dialog box
        AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor:
              Colors.transparent, // Make the background transparent
          elevation: 0.0, // Remove the shadow behind the dialog content

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Game finished',
                textAlign: TextAlign.center,
              ),
              Text(
                waitingTimeForRound.toString(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}


//  Navigator.of(context).pop();