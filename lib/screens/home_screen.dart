import 'package:flutter/material.dart';
import '../data/main_titles.dart';
import '../widgets/to_data_screen_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Geology Museum Database',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mainTitles.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: height * 12 / 844,
                start: width * 12 / 390,
                end: width * 12 / 390,
              ),
              child: ToDataScreenButton(i: index, height: height));
        },
      ),
    );
  }
}
