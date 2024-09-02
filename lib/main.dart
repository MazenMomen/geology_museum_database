import 'package:flutter/material.dart';
import 'package:geology_museum_database/screens/main_screen.dart';
import 'package:geology_museum_database/utils/app_colors.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geology Museum Database',
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
