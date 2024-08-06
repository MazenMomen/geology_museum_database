import 'package:flutter/material.dart';
import 'package:geology_museum_database/data/main_screen_titles.dart';

import '../widgets/app_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 18),
            child: Column(
              children: <Widget>[
                for (int i = 0; i < 5; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 18, start: 12, end: 12),
                      child: AppButton(
                        onPressed: () {},
                        child: mainScreenTitles[i],
                        minimumSize: Size(
                            double.infinity,
                            MediaQuery.of(context).size.height *
                                5 /
                                MediaQuery.of(context).size.height),
                        fontSize: 25,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
