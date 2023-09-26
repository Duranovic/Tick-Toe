// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:tick_toe_flutter/src/features/game/presentation/game.dart';
import 'package:tick_toe_flutter/src/features/home/presentation/select_difficulty.dart';
import 'package:tick_toe_flutter/src/routing/transition_page.dart';
import '../features/home/presentation/home.dart';
import '../features/home/presentation/select_mode.dart';

// ignore: unused_element
final router = GoRouter(
  routes: [
    GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => getCustomTransitionPage(
              state,
              const Home(),
            ),
        routes: [
          GoRoute(
            name: 'select-mode',
            path: 'select-mode',
            pageBuilder: (context, state) => getCustomTransitionPage(
              state,
              const SelectMode(),
            ),
            routes: [
              GoRoute(
                name: 'select-difficulty',
                path: 'select-difficulty',
                pageBuilder: (context, state) => getCustomTransitionPage(
                  state,
                  const SelectDifficulty(),
                ),
              ),
            ],
          ),
        ]),
    GoRoute(
      name: 'game',
      path: "/game",
      pageBuilder: (context, state) => getCustomTransitionPage(
        state,
        Game(),
      ),
    ),
  ],
);
