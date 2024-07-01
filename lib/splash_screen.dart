import 'package:flutter/material.dart';
import 'dart:async';

import './page/language_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLanguageSelection();
  }

  void _navigateToLanguageSelection() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LanguageSelection()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF327E89),
        ),
        child: Center(
          child: Image.asset(
            "assets/img/logo.png",
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
