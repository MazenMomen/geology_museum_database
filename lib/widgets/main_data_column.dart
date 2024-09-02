import 'package:flutter/widgets.dart';

import '../data/app_headers_lists.dart';

class MainDataColumn extends StatelessWidget {
  const MainDataColumn({
    super.key,
    required this.sampleIndex,
    required this.sample,
  });

  final int sampleIndex;
  final List sample;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 8, 18),
          child: Text('${sampleIndex + 1}'),
        ),
        for (int i = 0; i < mainHeaders.length - 1; i++)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 8, 18),
            child: Text(
              sample[i + 1] ?? 'N/A',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          )
      ],
    );
  }
}
