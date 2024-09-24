import 'package:flutter/material.dart';
import 'package:intern_app/features/splash/screens/splash_screen.dart';
import 'package:intern_app/provider/movie_provider.dart';
import 'package:intern_app/utils/pallete.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
    ),
  ], child: const MyApp()));
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
