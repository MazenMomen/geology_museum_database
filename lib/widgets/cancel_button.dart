import 'package:flutter/widgets.dart';

import 'app_text_button.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: AppTextButton(
        child: 'Cancel',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
