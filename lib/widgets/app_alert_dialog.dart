import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.white,
      icon: const Align(
        alignment: AlignmentDirectional.topEnd,
        child: CloseButton(),
      ),
      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
      iconColor: Colors.black,
      title: title,
      content: content,
      actions: actions,
    );
  }
}
