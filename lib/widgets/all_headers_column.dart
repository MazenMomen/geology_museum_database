import 'package:flutter/widgets.dart';

import '../data/app_headers_lists.dart';

class AllHeadersColumn extends StatelessWidget {
  const AllHeadersColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 8, 18),
          child: Text(
            mainHeaders[0],
          ),
        ),
        for (int i = 0; i < allHeaders.length; i++)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 8, 18),
            child: Text(
              allHeaders[i],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          )
      ],
    );
  }
}
