import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shop_easy/features/presentation/pages/Home.dart';


Page<dynamic> noTransitionPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

final GoRouter routerApp = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      pageBuilder: (context, state) => noTransitionPage(Home(), state),
    ),
  ]
);
