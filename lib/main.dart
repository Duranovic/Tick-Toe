import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/game.dart';
import 'package:tick_toe_flutter/src/features/home/presentation/home.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: "/game",
      builder: (context, state) => const Game(),
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
