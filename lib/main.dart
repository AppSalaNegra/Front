import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_view.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 14),
          displayMedium: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 24),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(height: 1, fontSize: 18, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
        ),
        primaryColorLight: const Color(0xFFFFB81C),
        primaryColorDark: const Color(0xFF2D2926),
        fontFamily: 'Avenir'
      ),
      home: const LoginView(),
    );
  }
}