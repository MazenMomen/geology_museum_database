import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Size? minimumSize;
  final double? fontSize;
  final double? elevation;
  final String child;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  const AppElevatedButton({
    super.key,
    this.minimumSize,
    this.fontSize,
    this.elevation,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: elevation,
        shadowColor: Colors.black,
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
