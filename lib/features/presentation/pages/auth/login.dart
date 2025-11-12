import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/presentation/providers/auth_provider.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text("Bienvenido de nuevoo"),
              ElevatedButton(
                onPressed: () {
                  ref.read(signUpUseCaseProvider).call("joarouge@gmail.com", "123456");
                },
                child: Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
