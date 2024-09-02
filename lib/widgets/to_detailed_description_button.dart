import 'package:flutter/material.dart';

import '../screens/sample_detailed_description_screen.dart';
import '../utils/app_colors.dart';
import 'app_elevated_button.dart';

class ToDetailedDescriptionButton extends StatelessWidget {
  final String category;
  final List<dynamic> sample;
  final int sampleIndex;
  final Function() onSampleUpdated;
  const ToDetailedDescriptionButton({
    super.key,
    required this.category,
    required this.sample,
    required this.sampleIndex,
    required this.onSampleUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppElevatedButton(
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.black,
        elevation: 10,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  SampleDetailedDescriptionScreen(
                category: category,
                sample: sample,
                sampleIndex: sampleIndex,
                onSampleUpdated: onSampleUpdated,
              ),
            ),
          );
        },
        child: 'Detailed description',
      ),
    );
  }
}
