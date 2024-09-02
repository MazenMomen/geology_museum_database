import 'package:flutter/widgets.dart';

import '../data/app_headers_lists.dart';

class MainHeadersColumn extends StatelessWidget {
  const MainHeadersColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < mainHeaders.length; i++)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 8, 18),
            child: Text(
              mainHeaders[i],
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          )
      ],
    );
  }
}
