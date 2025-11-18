import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:shop_easy/features/entitites/user_entity.dart';
import 'package:shop_easy/features/presentation/pages/Home.dart';
import 'package:shop_easy/features/presentation/pages/auth/login.dart';
import 'package:shop_easy/features/presentation/pages/auth/register.dart';
import 'package:shop_easy/features/presentation/pages/cart.dart';
import 'package:shop_easy/features/presentation/pages/category.dart';
import 'package:shop_easy/features/presentation/pages/profile.dart';
import 'package:shop_easy/features/providers/auth_provider.dart';

Page<dynamic> noTransitionPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
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
      GoRoute(
        path: "/register",
        pageBuilder: (context, state) => noTransitionPage(Register(), state),
      ),
      GoRoute(
        path: "/cart",
        pageBuilder: (context, state) => noTransitionPage(Cart(), state),
      ),
      GoRoute(
        path: "/loading",
        pageBuilder: (context, state) => noTransitionPage(
          const Scaffold(body: Center(child: CircularProgressIndicator())),
          state,
        ),
      ),
    ],

redirect: (BuildContext context, GoRouterState state) {
      // 1. **Manejar Estado de Carga (CRUCIAL):**
      if (authState.isLoading || authState.value == null && !authState.hasValue) {
        return '/loading';
      }

      final UserEntity? user = authState.value; // El usuario logueado o null
      
      // Rutas de autenticación (rutas públicas)
      final bool isLoggingIn = state.location == '/login' || state.location == '/register';

      // 2. **Lógica de Redirección Correcta:**

      // A) SI EL USUARIO NO ESTÁ LOGUEADO (user == null):
      if (user == null) {
        // Si intenta ir a una ruta pública (login/register), permite la navegación (return null).
        // Si intenta ir a CUALQUIER otra ruta (protegida), redirige a /login.
        return isLoggingIn ? null : '/login';
      } 
      
      // B) SI EL USUARIO SÍ ESTÁ LOGUEADO (user != null):
      if (isLoggingIn) {
        // Si está logueado y trata de ir a /login o /register, redirige a /home.
        return '/home';
      }

      // C) Para todas las demás rutas (protegidas):
      // Si el usuario está logueado, permite que la navegación continúe.
      return null;
    },
  );
});
