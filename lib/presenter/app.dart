import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_tune/presenter/auth/auth_provider.dart';
import 'package:text_tune/presenter/auth_wrapper.dart';
import 'package:text_tune/shared/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TextTune',
        theme: AppTheme.light(),
        home: const AuthWrapper(),
      ),
    );
  }
}
