import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class SampleImage extends StatelessWidget {
  const SampleImage({
    super.key,
    required File? selectedImage,
  }) : _selectedImage = selectedImage;

  final File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CircleAvatar(
      radius: width * 60 / 390,
      backgroundColor: Colors.white,
      backgroundImage: _selectedImage == null
          ? const AssetImage(Assets.logo)
          : FileImage(_selectedImage),
    );
  }
}
