import 'package:flutter/material.dart';

class NetflixTheme {
  static const Color netflixRed = Color(0xFFE50914);
  static const Color netflixBlack = Color(0xFF141414);
  static const Color netflixWhite = Color(0xFFFFFFFF);
  static const Color netflixGrey = Color(0xFF221F1F);
  static const Color netflixTextGrey = Color(0xFFB3B3B3);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: netflixRed,
    scaffoldBackgroundColor: netflixWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: netflixRed,
      titleTextStyle: TextStyle(
        color: netflixWhite,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: netflixWhite),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: netflixBlack),
      bodyMedium: TextStyle(color: netflixBlack),
      bodySmall: TextStyle(color: netflixBlack, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: netflixBlack),
    buttonTheme: const ButtonThemeData(
      buttonColor: netflixRed,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: netflixRed,
    scaffoldBackgroundColor: netflixBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: netflixBlack,
      titleTextStyle: TextStyle(
        color: netflixWhite,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: netflixWhite),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: netflixWhite),
      bodyMedium: TextStyle(color: netflixTextGrey),
      bodySmall: TextStyle(color: netflixWhite, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: netflixWhite),
    buttonTheme: const ButtonThemeData(
      buttonColor: netflixRed,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
