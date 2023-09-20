import 'package:flutter/material.dart';

class MissedMove extends StatelessWidget {
  const MissedMove({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.warning_rounded,
            color: Colors.white, size: 30.0), // The warning icon
        SizedBox(height: 10.0),
        Text(
          "Opponent missed the move.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        SizedBox(height: 3.0),
        Text(
          "You are back to the normal flow.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        )
      ],
    );
  }
}
