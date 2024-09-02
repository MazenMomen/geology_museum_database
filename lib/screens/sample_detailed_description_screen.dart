import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geology_museum_database/widgets/all_headers_column.dart';
import '../utils/app_images.dart';
import '../widgets/all_data_column.dart';
import '../widgets/delete_sample_button.dart';
import '../widgets/to_edit_sample_button.dart';

class SampleDetailedDescriptionScreen extends StatelessWidget {
  final List<dynamic> sample;
  final int sampleIndex;
  final String category;
  final Function() onSampleUpdated;

  const SampleDetailedDescriptionScreen({
    super.key,
    required this.sample,
    required this.sampleIndex,
    required this.category,
    required this.onSampleUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        leading: const BackButton(),
        title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('${sample[2]} Detailed Description')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InteractiveViewer(
              child: sample[0].toString().isNotEmpty
                  ? Image.file(File(sample[0].toString()))
                  : Image.asset(Assets.logo),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AllHeadersColumn(),
                AllDataColumn(sampleIndex: sampleIndex, sample: sample),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToEditSampleButton(
                    category: category,
                    sampleIndex: sampleIndex,
                    onSampleUpdated: onSampleUpdated,
                  ),
                  DeleteSampleButton(
                    category: category,
                    sampleIndex: sampleIndex,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
