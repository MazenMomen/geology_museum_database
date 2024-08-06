import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String child;
  final Size? minimumSize;
  final double? fontSize;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minimumSize,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFA7300),
        foregroundColor: const Color(0xFF000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 25,
        shadowColor: const Color(0xFF000000),
        minimumSize: minimumSize,
        splashFactory: InkRipple.splashFactory,
      ),
      child: Text(
        child,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
