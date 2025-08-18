import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_tune/presenter/auth/auth_provider.dart';
import 'package:text_tune/presenter/auth/widgets/login_button.dart';
import 'package:text_tune/shared/themes/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.lg),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Text Tune',
                    style: AppTextStyles.headlineLg.copyWith(
                      color: AppColors.greenDark,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacings.verticalXLg,
                  AppSpacings.verticalMd,
                  AppSpacings.verticalLg,
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  AppSpacings.verticalMd,
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  AppSpacings.verticalMd,
                  LoginButton.private(
                    onTap: () => authProvider.signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    ),
                  ),
                  AppSpacings.verticalSm,
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Não tem conta? Cadastre-se',
                      style: AppTextStyles.md.copyWith(
                        color: AppColors.greenDark,
                      ),
                    ),
                  ),
                  if (authProvider.errorMessage != null) ...[
                    AppSpacings.verticalSm,
                    Text(
                      authProvider.errorMessage!,
                      style: AppTextStyles.sm.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ],
                  AppSpacings.verticalMd,
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppInsets.xs,
                        ),
                        child: Text('OU'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  AppSpacings.verticalMd,
                  LoginButton.google(
                    onTap: authProvider.signInWithGoogle,
                  ),
                  // if (Theme.of(context).platform == TargetPlatform.iOS)
                  Padding(
                    padding: const EdgeInsets.only(top: AppInsets.md),
                    child: LoginButton.apple(
                      onTap: authProvider.signInWithApple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
