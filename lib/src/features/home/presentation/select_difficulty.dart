import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/shared/presentation/app_bar.dart';

import '../../../shared/presentation/button.dart';

class SelectDifficulty extends StatelessWidget {
  const SelectDifficulty({super.key});

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
                "Please select a difficulty mode\n you want to play!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Button(
                text: "EASY",
                onPressed: () => context.go('/game'),
              ),
              const SizedBox(height: 16),
              Button(
                text: "MEDIUM",
                onPressed: () => context.go('/game'),
              ),
              const SizedBox(height: 16),
              Button(
                text: "HARD",
                onPressed: () => context.go('/game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
