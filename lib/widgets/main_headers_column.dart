import 'package:flutter/widgets.dart';

import '../data/app_headers_lists.dart';

class MainHeadersColumn extends StatelessWidget {
  const MainHeadersColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < mainHeaders.length; i++)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              height * 18 / 844,
              height * 8 / 844,
              height * 18 / 844,
            ),
            child: Text(
              mainHeaders[i],
              style: TextStyle(
                fontSize: width * 15 / 390,
              ),
            ),
          )
      ],
    );
  }
}
