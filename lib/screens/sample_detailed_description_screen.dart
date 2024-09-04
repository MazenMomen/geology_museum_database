import 'dart:io';
import 'package:flutter/material.dart';
import '../utils/app_images.dart';
import '../widgets/delete_sample_button.dart';
import '../widgets/sample_all_description_content.dart';
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.white,
            leading: const BackButton(),
            title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('${sample[2]} Detailed Description')),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                InteractiveViewer(
                  child: sample[0].toString().isNotEmpty
                      ? Image.file(File(sample[0].toString()))
                      : Image.asset(Assets.logo),
                ),
                SampleAllDescriptionContent(
                  sampleIndex: sampleIndex,
                  sample: sample,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
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
        ],
      ),
    );
  }
}
