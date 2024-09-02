import 'package:flutter/material.dart';

import '../data/main_titles.dart';
import '../screens/data_screen.dart';
import '../services/database_service.dart';
import '../utils/app_colors.dart';
import 'app_elevated_button.dart';

class DeleteSampleButton extends StatelessWidget {
  final String category;
  final int sampleIndex;
  const DeleteSampleButton({
    super.key,
    required this.category,
    required this.sampleIndex,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: AppElevatedButton(
        onPressed: () {
          DatabaseService.deleteSample(category, sampleIndex);
          Navigator.pushAndRemoveUntil<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DataScreen(
                      title: mainTitles
                          .firstWhere((element) => element == category),
                    )),
            ModalRoute.withName('/'),
          );
        },
        child: 'Delete sample',
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
