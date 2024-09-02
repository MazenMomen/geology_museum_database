import 'package:flutter/material.dart';
import 'package:geology_museum_database/screens/add_and_edit_sample_screen.dart';
import '../services/database_service.dart';
import 'app_text_button.dart';

class ToEditSampleButton extends StatelessWidget {
  final String category;
  final int sampleIndex;
  final Function() onSampleUpdated;

  const ToEditSampleButton({
    super.key,
    required this.category,
    required this.sampleIndex,
    required this.onSampleUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: AppTextButton(
        onPressed: () {
          final sample = DatabaseService.getSample(category, sampleIndex);

          if (sample != null) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AddAndEditSampleScreen(
                  title: 'Edit ${sample[2]} description',
                  buttonFunctionality: 'Save changes',
                  category: category,
                  sample: sample,
                  sampleIndex: sampleIndex,
                  onSampleUpdated: onSampleUpdated,
                ),
              ),
            );
          }
        },
        child: 'Edit sample',
      ),
    );
  }
}
