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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            0,
            height * 18 / 844,
            height * 8 / 844,
            height * 18 / 844,
          ),
          child: Text('${sampleIndex + 1}'),
        ),
        for (int i = 0; i < mainHeaders.length - 1; i++)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              height * 18 / 844,
              height * 8 / 844,
              height * 18 / 844,
            ),
            child: Text(
              sample[i + 1] ?? 'N/A',
              style: TextStyle(
                fontSize: width * 15 / 390,
              ),
            ),
          )
      ],
    );
  }
}
