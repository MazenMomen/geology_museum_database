import 'package:flutter/material.dart';

class ReversedBackButton extends StatelessWidget {
  const ReversedBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_forward));
  }
}
