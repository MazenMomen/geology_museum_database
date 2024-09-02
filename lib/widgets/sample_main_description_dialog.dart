import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geology_museum_database/widgets/sample_image.dart';
import 'main_data_column.dart';
import 'main_headers_column.dart';
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
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.white,
      icon: const Align(
        alignment: AlignmentDirectional.topEnd,
        child: CloseButton(),
      ),
      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
      iconColor: Colors.black,
      title: SampleImage(
        selectedImage:
            sample[0].toString().isNotEmpty ? File(sample[0].toString()) : null,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 300 / 844,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MainHeadersColumn(),
              MainDataColumn(sampleIndex: sampleIndex, sample: sample),
            ],
          ),
        ),
      ),
      actions: [
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
