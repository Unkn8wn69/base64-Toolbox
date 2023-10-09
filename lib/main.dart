import 'package:base64_toolbox/home_page.dart';
import 'package:base64_toolbox/onboarding_screen.dart';
import 'package:base64_toolbox/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasOnboardingBeenShown = prefs.getBool('hasOnboardingBeenShown') ?? false;

  runApp(MainApp(hasOnboardingBeenShown: hasOnboardingBeenShown));
}

class MainApp extends StatelessWidget {
  final bool hasOnboardingBeenShown;

  MainApp({required this.hasOnboardingBeenShown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasOnboardingBeenShown ? HomePage() : OnBoardingScreen(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
