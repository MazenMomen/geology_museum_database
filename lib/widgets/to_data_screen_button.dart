import 'package:flutter/material.dart';
import 'package:geology_museum_database/data/main_titles.dart';
import '../screens/data_screen.dart';
import '../utils/app_colors.dart';
import 'app_elevated_button.dart';

class ToDataScreenButton extends StatelessWidget {
  const ToDataScreenButton({
    super.key,
    required this.i,
    required this.height,
  });

  final int i;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => DataScreen(
              title: mainTitles[i],
            ),
          ),
        );
      },
      child: mainTitles[i],
      minimumSize: Size(double.infinity, height * 132 / height),
      fontSize: 25,
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.black,
      elevation: 25,
    );
  }
}
