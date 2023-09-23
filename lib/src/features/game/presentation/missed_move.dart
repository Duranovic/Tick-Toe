import 'package:flutter/material.dart';

class MissedMove extends StatelessWidget {
  final String? title;
  final String? description;
  const MissedMove({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.warning_rounded,
            color: Colors.white, size: 30.0), // The warning icon
        const SizedBox(height: 10.0),
        Text(
          title ?? 'Missed Move',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(height: 3.0),
        Text(
          description ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14.0, color: Colors.white),
        )
      ],
    );
  }
}
