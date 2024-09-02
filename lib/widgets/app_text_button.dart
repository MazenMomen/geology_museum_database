import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String child;
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: AppColors.mainColor,
              width: 1.5,
            ),
          ),
        ),
        splashFactory: InkRipple.splashFactory,
      ),
      child: Text(
        child,
        style: const TextStyle(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
