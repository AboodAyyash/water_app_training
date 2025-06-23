import 'package:flutter/material.dart';

// Light Theme: Teal and White
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Colors.white,

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white, // Text and icon color
    elevation: 4.0,
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal, // Button color
      foregroundColor: Colors.white, // Text color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(color: Colors.black54),
    titleSmall: TextStyle(color: Colors.black54),
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.black87),
    bodySmall: TextStyle(color: Colors.black54),
    labelLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ), // For buttons
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2.0,
    margin: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),

  // Icon Theme
  iconTheme: const IconThemeData(color: Colors.teal),

  // Input Decoration Theme for TextFields
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.teal),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.teal, width: 2.0),
    ),
    labelStyle: const TextStyle(color: Colors.teal),
  ),
);

// Dark Theme: Teal on Dark Background
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  primaryColor: Colors.tealAccent,
  scaffoldBackgroundColor: Colors.grey[900],

  // AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850],
    foregroundColor: Colors.tealAccent, // Text and icon color
    elevation: 4.0,
    iconTheme: const IconThemeData(color: Colors.tealAccent),
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
    foregroundColor: Colors.black,
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.tealAccent, // Button color
      foregroundColor: Colors.black, // Text color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),

  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(color: Colors.white70),
    titleSmall: TextStyle(color: Colors.white70),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white70),
    labelLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ), // For buttons
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: Colors.grey[800],
    elevation: 2.0,
    margin: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),

  // Icon Theme
  iconTheme: const IconThemeData(color: Colors.tealAccent),

  // Input Decoration Theme for TextFields
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.tealAccent, width: 2.0),
    ),
    labelStyle: const TextStyle(color: Colors.tealAccent),
  ),
);
