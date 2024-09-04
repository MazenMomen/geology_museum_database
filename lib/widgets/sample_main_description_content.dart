import 'package:flutter/widgets.dart';

import 'main_data_column.dart';
import 'main_headers_column.dart';

class SampleMainDescriptionContent extends StatelessWidget {
  const SampleMainDescriptionContent({
    super.key,
    required this.sampleIndex,
    required this.sample,
  });

  final int sampleIndex;
  final List sample;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 300 / 844,
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
    );
  }
}
