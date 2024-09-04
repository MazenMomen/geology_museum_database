import 'package:flutter/material.dart';

import '../data/app_headers_lists.dart';
import '../utils/app_colors.dart';

class AddAndEditSampleField extends StatelessWidget {
  const AddAndEditSampleField({
    super.key,
    required List<TextEditingController> controllers,
  }) : _controllers = controllers;

  final List<TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...List.generate(
          allHeaders.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              controller: _controllers[index],
              decoration: InputDecoration(
                labelText: allHeaders[index],
                labelStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.mainColor,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
