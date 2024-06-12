import 'package:flutter/material.dart';
import 'package:sala_negra/api/api_operations.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/shared/nav.dart';
import 'package:sala_negra/utilities/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const SalaNegraApp());

class SalaNegraApp extends StatelessWidget {
  const SalaNegraApp({super.key});

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
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        primaryColorLight: const Color(0xFFFFB81C),
        primaryColorDark: const Color(0xFF2D2926),
        fontFamily: 'Avenir',
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.black,
          cursorColor: Colors.black,
          selectionColor: AppColors.primaryColor.withAlpha(150)
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Session.getInstance().updateSession(
        token: prefs.getString('token') == null ? '' : prefs.getString('token')!, 
        id: prefs.getString('id') == null ? '' : prefs.getString('id')!
      );
      ApiOperations.getInstance().getUserEvents(prefs.getString('id')!, prefs.getString('token')!);
      // ignore: use_build_context_synchronously
      ApiOperations.getInstance().setContext(context);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}