import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/shared/presentation/app_bar.dart';
import '../../../shared/presentation/button.dart';

class SelectMode extends StatelessWidget {
  const SelectMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(
                'assets/images/logo.png',
                width: 54,
                height: 54,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                "Please select a game mode\n you want to play!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Button(
                text: "VS COMPUTER",
                onPressed: () => context.goNamed('select-difficulty'),
              ),
              const SizedBox(height: 16),
              Button(
                text: "VS PLAYER",
                onPressed: () => context.go('/game'),
              ),
              const SizedBox(height: 16),
              Button(
                text: "PLAY ONLINE",
                onPressed: () => context.go('/game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
