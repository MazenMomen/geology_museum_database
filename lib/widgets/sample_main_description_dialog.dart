import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geology_museum_database/widgets/app_alert_dialog.dart';
import 'package:geology_museum_database/widgets/sample_image.dart';
import 'sample_main_description_content.dart';
import 'to_detailed_description_button.dart';

class SampleMainDescriptionDialog extends StatelessWidget {
  final List<dynamic> sample;
  final int sampleIndex;
  final String category;
  final Function() onSampleUpdated;

  const SampleMainDescriptionDialog({
    super.key,
    required this.sample,
    required this.sampleIndex,
    required this.category,
    required this.onSampleUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: SampleImage(
        selectedImage:
            sample[0].toString().isNotEmpty ? File(sample[0].toString()) : null,
      ),
      content: SampleMainDescriptionContent(
        sampleIndex: sampleIndex,
        sample: sample,
      ),
      actions: <ToDetailedDescriptionButton>[
        ToDetailedDescriptionButton(
          category: category,
          sample: sample,
          sampleIndex: sampleIndex,
          onSampleUpdated: onSampleUpdated,
        ),
      ],
    );
  }
}
