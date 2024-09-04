import 'package:flutter/widgets.dart';

import '../data/app_headers_lists.dart';

class AllHeadersColumn extends StatelessWidget {
  const AllHeadersColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            0,
            height * 18 / 844,
            height * 8 / 844,
            height * 18 / 844,
          ),
          child: Text(
            mainHeaders[0],
            style: TextStyle(
              fontSize: width * 16 / 390,
            ),
          ),
        ),
        for (int i = 0; i < allHeaders.length; i++)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              0,
              height * 18 / 844,
              height * 8 / 844,
              height * 18 / 844,
            ),
            child: Text(
              allHeaders[i],
              style: TextStyle(
                fontSize: width * 16 / 390,
              ),
            ),
          )
      ],
    );
  }
}
