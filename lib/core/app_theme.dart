import 'package:flutter/material.dart';

class AppTheme {
  // 🔹 Tema Escuro (Dark Theme) - Azul e Laranja
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF002F6C), // Azul escuro
    scaffoldBackgroundColor: const Color(0xFF1E1E1E), // Fundo escuro suave
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF002F6C), // Azul escuro
      onPrimary: Colors.white, // Texto sobre primária
      secondary: Color(0xFFFF8C00), // Laranja vibrante
      onSecondary: Colors.black, // Texto sobre secundária
      error: Color(0xFFFF5252),
      onError: Colors.white, // Texto sobre fundo
      surface: Color(0xFF3A3A3A), // Superfície para cartões/botões
      onSurface: Colors.white, // Texto sobre superfície
    ),
    fontFamily: 'Georgia',

    // Estilo do AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF002F6C), // Azul escuro
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),

    // Estilo dos Botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF8C00), // Laranja vibrante
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // Estilo dos Inputs (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF3A3A3A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFFF8C00), width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.white70),
    ),
  );

  // 🔹 Tema Claro (Light Theme) - Azul e Laranja
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF002F6C), // Azul escuro
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF002F6C), // Azul escuro
      onPrimary: Colors.white,
      secondary: Color(0xFFFF8C00), // Laranja vibrante
      onSecondary: Colors.black,
      error: Color(0xFFFF5252),
      onError: Colors.white,
      surface: Color(0xFFF5F5F5),
      onSurface: Colors.black,
    ),
    fontFamily: 'Georgia',

    // Estilo do AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF002F6C), // Azul escuro
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),

    // Estilo dos Botões
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF8C00), // Laranja vibrante
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // Estilo dos Inputs (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFFF8C00), width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.black54),
    ),
  );
}
