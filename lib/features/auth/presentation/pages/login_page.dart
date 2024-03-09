import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/extensions/context_ext.dart';
import '../../../../core/theme/app_pallete.dart';
import '../notifiers/auth_notifier.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            ref.listen(authNotifierProvider, (_, AsyncValue<AuthState> state) {
              state.whenOrNull(
                error: (Object error, StackTrace? stackTrace) {
                  return switch (error) {
                    Failure(:final String message) =>
                      context.showSnackBar(message),
                    _ => null,
                  };
                },
              );
            });
            return switch (ref.watch(authNotifierProvider)) {
              AsyncLoading<AuthState>() => const Loader(),
              _ => Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Sign In.',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      AuthField(
                        hintText: 'Password',
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AuthGradientButton(
                        buttonText: 'Sign in',
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            ref.read(authNotifierProvider.notifier).login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => context.push(const SignUpPage()),
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppPallete.gradient2,
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
            };
          },
        ),
      ),
    );
  }
}
