import 'package:base64_toolbox/onboarding_screen.dart';
import 'package:base64_toolbox/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
