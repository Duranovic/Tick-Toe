import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => {context.go('/')},
        child: const Text('Play Game'),
      ),
    );
  }
}
