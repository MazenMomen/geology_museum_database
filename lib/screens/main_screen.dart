import 'package:flutter/material.dart';
import '../widgets/to_data_screen_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
      body: Center(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < 5; i++)
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 18, start: 12, end: 12),
                  child: ToDataScreenButton(i: i, height: height),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
