import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/screens/home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muktar Zakari - Portfolio',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: "Lato",
            color: bodyTextColor,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Lato",
            color: bodyTextColor,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            fontFamily: "Lato",
            color: bodyTextColor,
            fontSize: 12,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
