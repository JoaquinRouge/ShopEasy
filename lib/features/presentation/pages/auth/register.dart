import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shop_easy/core/auth_error_mapper.dart';
import 'package:shop_easy/features/providers/auth_provider.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Título y subtítulo ---
              Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Completa los campos para registrarte en la app",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // --- Formulario ---
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Nombre
                    _buildInputField(
                      controller: _usernameController,
                      hintText: "Nombre completo",
                      prefixIcon: HeroIcons.user,
                      context: context,
                    ),
                    const SizedBox(height: 12),

                    // Correo electrónico
                    _buildInputField(
                      controller: _emailController,
                      hintText: "Correo electrónico",
                      prefixIcon: HeroIcons.envelope,
                      context: context,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),

                    // Contraseña
                    _buildInputField(
                      controller: _passwordController,
                      hintText: "Contraseña",
                      prefixIcon: HeroIcons.lockClosed,
                      context: context,
                      obscureText: !_showPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: HeroIcon(
                          _showPassword ? HeroIcons.eyeSlash : HeroIcons.eye,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Botón de registro
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          try {
                            setState(() {
                              _loading = !_loading;
                            });

                            await ref
                                .read(signUpUseCaseProvider)
                                .call(
                                  _emailController.text,
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                            context.go("/home");
                          } on FirebaseAuthException catch (e) {
                            final message = AuthErrorMapper.mapError(e.code);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: Colors.red,
                              ),
                            );

                            setState(() {
                              _loading = !_loading;
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: Colors.red,
                              ),
                            );

                            setState(() {
                              _loading = !_loading;
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 8),
                            if (_loading) ...[
                              CircularProgressIndicator(color: Colors.white),
                            ],
                            if (!_loading) ...[
                              HeroIcon(
                                HeroIcons.userPlus,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Registrarte",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Volver al login
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "¿Ya tenés una cuenta? ",
                          style: const TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "Iniciá sesión",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget reutilizable para inputs ---
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required HeroIcons prefixIcon,
    required BuildContext context,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: HeroIcon(
          prefixIcon,
          color: Theme.of(context).colorScheme.primary,
          size: 28,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.8),
        ),
      ),
    );
  }
}
