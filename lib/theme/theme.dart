import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.deepPurple.shade200,
    primary: Colors.deepPurple.shade300,
    secondary: Colors.deepPurple.shade500,

  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.deepPurple.shade500,
    primary: Colors.deepPurple.shade900,
    secondary: Colors.deepPurple.shade600,

  )
);