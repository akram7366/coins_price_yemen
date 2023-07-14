import 'package:flutter/material.dart';

ThemeData myTheme({Brightness brightness = Brightness.light}) => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: brightness
      ),
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        elevation: 3,
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        margin: EdgeInsets.only(bottom: 20),
      ),
    );