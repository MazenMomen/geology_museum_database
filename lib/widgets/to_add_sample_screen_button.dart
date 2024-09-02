import 'package:flutter/material.dart';
import '../screens/add_and_edit_sample_screen.dart';
import '../screens/data_screen.dart';
import '../utils/app_colors.dart';

class ToAddSampleScreenButton extends StatelessWidget {
  const ToAddSampleScreenButton({
    super.key,
    required this.widget,
    required this.onSampleUpdated,
  });

  final DataScreen widget;
  final Function() onSampleUpdated;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.post_add, color: AppColors.mainColor),
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => AddAndEditSampleScreen(
                    title: 'Add a New Sample to ${widget.title}',
                    buttonFunctionality: 'Add Sample',
                    category: widget.title,
                    onSampleUpdated: onSampleUpdated,
                  )),
        );
      },
    );
  }
}
