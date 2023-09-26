import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage getCustomTransitionPage(
    GoRouterState state, Widget childWidget) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: childWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Change the opacity of the screen using a Curve based on the the animation's value
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
