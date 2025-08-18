import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_tune/presenter/auth/auth_provider.dart';
import 'package:text_tune/presenter/auth/login_page.dart';
import 'package:text_tune/presenter/home/home_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isAuthenticated) return HomePage();
        return LoginPage();
      },
    );
  }
}
