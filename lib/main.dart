import 'package:flutter/material.dart';
import 'package:start/pages/intro.dart';
import 'package:start/pages/splash.dart';
import 'package:start/shared/shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashPage(),
      navigatorKey: navigatorKey,
    );
  }
}
