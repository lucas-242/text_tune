import 'package:flutter/material.dart';
import 'package:text_tune/presenter/auth/auth_wrapper.dart';
import 'package:text_tune/shared/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextTune',
      theme: AppTheme.light(),
      home: const AuthWrapper(),
    );
  }
}
