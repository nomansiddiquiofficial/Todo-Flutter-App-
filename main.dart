import 'package:flutter/material.dart';
import 'package:todo_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF415a77, <int, Color>{
          50: Color(0xFF778da9), // Adjust the shades as per your need
          100: Color(0xFF778da9),
          200: Color(0xFF778da9),
          300: Color(0xFF778da9),
          400: Color(0xFF778da9),
          500: Color(0xFF778da9),
          600: Color(0xFF778da9),
          700: Color(0xFF778da9),
          800: Color(0xFF778da9),
          900: Color.fromRGBO(119, 141, 169, 1),
        }),
      ),
      home: const MainPage(),
    );
  }
}
