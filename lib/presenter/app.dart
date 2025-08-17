import 'package:flutter/material.dart';
import 'package:text_tune/presenter/auth/auth_wrapper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextTune',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF1B5E20),
        hintColor: const Color(0xFF4CAF50),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B5E20),
          foregroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFF1B5E20),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B5E20),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF1B5E20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF1B5E20), width: 2.0),
          ),
          labelStyle: const TextStyle(color: Color(0xFF1B5E20)),
        ),
      ),
      home: const AuthWrapper(),
    );
  }
}
