import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_easy/features/presentation/providers/auth_provider.dart';
import 'package:shop_easy/features/presentation/widgets/appbar.dart';
import 'package:shop_easy/features/presentation/widgets/bottomBar.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await ref.read(signOutUseCaseProvider).call();
              context.go("/login");
            } on FirebaseAuthException catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error: ${e.message}"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Text("Log Out"),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
