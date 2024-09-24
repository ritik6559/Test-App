import 'package:flutter/material.dart';
import 'package:intern_app/features/splash/screens/splash_screen.dart';
import 'package:intern_app/utils/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern App',
      theme: NetflixTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
