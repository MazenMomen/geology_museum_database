import 'package:flutter/material.dart';
import 'package:geology_museum_database/utils/app_colors.dart';
import 'package:geology_museum_database/widgets/app_elevated_button.dart';
import '../services/database_service.dart';
import '../widgets/reversed_back_button.dart';
import '../widgets/sample_main_description_dialog.dart';
import '../widgets/to_add_sample_screen_button.dart';

class DataScreen extends StatefulWidget {
  final String title;
  const DataScreen({
    super.key,
    required this.title,
  });

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<List<dynamic>> samples = [];
  List<List<dynamic>> filteredSamples = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSamples();
    searchController.addListener(_filterSamples);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void loadSamples() {
    final categoryData = DatabaseService.database.firstWhere(
      (c) => c["categoryName"] == widget.title,
      orElse: () => {"data": []},
    );
    setState(() {
      samples = List<List<dynamic>>.from(categoryData["data"]);
      filteredSamples = samples;
    });
  }

  void _filterSamples() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSamples = samples.where((sample) {
        final sampleName = sample[2].toString().toLowerCase();
        return sampleName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: CustomScrollView(
        slivers: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: SliverAppBar.medium(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              surfaceTintColor: Colors.white,
              leading: ToAddSampleScreenButton(
                widget: widget,
                onSampleUpdated: loadSamples,
              ),
              title: SizedBox(
                height: MediaQuery.of(context).size.height * 30 / 844,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    controller: searchController,
                    maxLines: 1,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Search ${widget.title}',
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: AppColors.mainColor,
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const CloseButtonIcon(),
                              alignment: Alignment.topRight,
                              padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              iconSize: 20,
                              onPressed: () {
                                searchController.clear();
                                _filterSamples();
                              },
                            )
                          : null,
                      suffixIconColor: AppColors.mainColor,
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mainColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.mainColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Row>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const ReversedBackButton()
                  ],
                )
              ],
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: AppElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SampleMainDescriptionDialog(
                          sample: filteredSamples[index],
                          sampleIndex: samples.indexOf(filteredSamples[index]),
                          category: widget.title,
                          onSampleUpdated: loadSamples,
                        );
                      },
                      barrierDismissible: false,
                    );
                  },
                  child: filteredSamples[index][2],
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 10,
                ),
              );
            },
            itemCount: filteredSamples.length,
          ),
        ],
      ),
    );
  }
}
