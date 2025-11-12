import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shop_easy/features/presentation/pages/Home.dart';
import 'package:shop_easy/features/presentation/pages/auth/login.dart';
import 'package:shop_easy/features/presentation/pages/category.dart';
import 'package:shop_easy/features/presentation/pages/profile.dart';

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
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/home",
      pageBuilder: (context, state) => noTransitionPage(Home(), state),
    ),
    GoRoute(
      path: "/category",
      pageBuilder: (context, state) => noTransitionPage(Category(), state),
    ),
    GoRoute(
      path: "/profile",
      pageBuilder: (context, state) => noTransitionPage(Profile(), state),
    ),
    GoRoute(
      path: "/login",
      pageBuilder: (context, state) => noTransitionPage(Login(), state),
    ),
  ],
);
