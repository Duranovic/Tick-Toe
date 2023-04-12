// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/game.dart';
import '../features/home/presentation/home.dart';

// ignore: unused_element
final router = GoRouter(
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
