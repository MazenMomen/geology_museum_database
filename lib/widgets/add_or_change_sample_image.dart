import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geology_museum_database/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import 'sample_image.dart';

class AddOrChangeSampleImage extends StatefulWidget {
  final String? initialImagePath;
  final Function(String?) onImageChanged;
  const AddOrChangeSampleImage({
    super.key,
    this.initialImagePath,
    required this.onImageChanged,
  });

  @override
  State<AddOrChangeSampleImage> createState() => _AddOrChangeSampleImageState();
}

class _AddOrChangeSampleImageState extends State<AddOrChangeSampleImage> {
  File? _selectedImage;
  @override
  void initState() {
    super.initState();
    if (widget.initialImagePath != null) {
      _selectedImage = File(widget.initialImagePath ?? "assets/logo.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              _deletePickedImage();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: AppColors.mainColor,
            )),
        SampleImage(selectedImage: _selectedImage),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                icon: const Icon(
                  Icons.photo_outlined,
                  color: AppColors.mainColor,
                )),
            IconButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.mainColor,
                )),
          ],
        )
      ],
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
    widget.onImageChanged(_selectedImage?.path);
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
    widget.onImageChanged(_selectedImage?.path);
  }

  _deletePickedImage() {
    setState(() {
      _selectedImage = null;
    });
    widget.onImageChanged(null);
  }
}
