import 'package:flutter/material.dart';
import 'package:geology_museum_database/screens/data_screen.dart';
import '../data/app_headers_lists.dart';
import '../data/main_titles.dart';
import '../services/database_service.dart';
import '../utils/app_colors.dart';
import '../widgets/add_or_change_sample_image.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/cancel_button.dart';

class AddAndEditSampleScreen extends StatefulWidget {
  final String title;
  final String buttonFunctionality;
  final List<dynamic>? sample;
  final String category;
  final int? sampleIndex;
  final Function() onSampleUpdated;

  const AddAndEditSampleScreen({
    super.key,
    required this.title,
    required this.buttonFunctionality,
    required this.category,
    required this.onSampleUpdated,
    this.sample,
    this.sampleIndex,
  });

  @override
  State<AddAndEditSampleScreen> createState() => _AddAndEditSampleScreenState();
}

class _AddAndEditSampleScreenState extends State<AddAndEditSampleScreen> {
  late List<dynamic> _sampleData;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _sampleData = widget.sample ?? List.filled(allHeaders.length + 1, "");
    _controllers = List.generate(
      allHeaders.length,
      (index) => TextEditingController(text: _sampleData[index + 1] ?? ""),
    );
  }

  void _saveSample() {
    for (int i = 0; i < allHeaders.length; i++) {
      _sampleData[i + 1] = _controllers[i].text;
    }
    if (widget.sample == null) {
      DatabaseService.addSample(widget.category, _sampleData);
    } else {
      DatabaseService.updateSample(
          widget.category, widget.sampleIndex!, _sampleData);
    }
    widget.onSampleUpdated();
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => DataScreen(
                title: mainTitles[mainTitles.indexOf(widget.category)],
              )),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(widget.title),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddOrChangeSampleImage(
              initialImagePath: null,
              onImageChanged: (String? path) {
                setState(() {
                  _sampleData[0] = path;
                });
              },
            ),
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
                          color: AppColors.mainColor, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppElevatedButton(
                    onPressed: _saveSample,
                    child: widget.buttonFunctionality,
                    backgroundColor: AppColors.mainColor,
                    foregroundColor: Colors.white,
                  ),
                  const CancelButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
