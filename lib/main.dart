import 'package:flutter/material.dart';
import 'package:geology_museum_database/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geology Museum Database',
      theme: ThemeData(
        primaryColor: const Color(0xFFFA7300),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
