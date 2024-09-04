import 'package:flutter/widgets.dart';

import 'all_data_column.dart';
import 'all_headers_column.dart';

class SampleAllDescriptionContent extends StatelessWidget {
  const SampleAllDescriptionContent({
    super.key,
    required this.sampleIndex,
    required this.sample,
  });

  final int sampleIndex;
  final List sample;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AllHeadersColumn(),
        AllDataColumn(sampleIndex: sampleIndex, sample: sample),
      ],
    );
  }
}
