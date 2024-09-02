import 'package:get_storage/get_storage.dart';

class DatabaseService {
  static final GetStorage _storage = GetStorage();
  static const String _databaseKey = 'geology_museum_database';

  static List<Map<String, dynamic>> get database {
    return (_storage.read(_databaseKey) as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ??
        [
          {
            "categoryName": "Igneous Rocks",
            "data": <List<dynamic>>[],
          },
          {
            "categoryName": "Metamorphic Rocks",
            "data": <List<dynamic>>[],
          },
          {
            "categoryName": "Sedimentary Rocks",
            "data": <List<dynamic>>[],
          },
          {
            "categoryName": "Minerals",
            "data": <List<dynamic>>[],
          },
          {
            "categoryName": "Fossils",
            "data": <List<dynamic>>[],
          },
        ];
  }

  static void _saveDatabase(List<Map<String, dynamic>> db) {
    _storage.write(_databaseKey, db);
  }

  static void addSample(String category, List<dynamic> sample) {
    final db = database;
    final categoryIndex = db.indexWhere((c) => c["categoryName"] == category);
    if (categoryIndex != -1) {
      db[categoryIndex]["data"].add(sample);
      _saveDatabase(db);
    }
  }

  static void updateSample(
      String category, int sampleIndex, List<dynamic> updatedSample) {
    final db = database;
    final categoryIndex = db.indexWhere((c) => c["categoryName"] == category);
    if (categoryIndex != -1 && sampleIndex < db[categoryIndex]["data"].length) {
      db[categoryIndex]["data"][sampleIndex] = updatedSample;
      _saveDatabase(db);
    }
  }

  static void deleteSample(String category, int sampleIndex) {
    final db = database;
    final categoryIndex = db.indexWhere((c) => c["categoryName"] == category);
    if (categoryIndex != -1 && sampleIndex < db[categoryIndex]["data"].length) {
      db[categoryIndex]["data"].removeAt(sampleIndex);
      _saveDatabase(db);
    }
  }

  static List<dynamic>? getSample(String category, int sampleIndex) {
    final db = database;
    final categoryData = db.firstWhere((c) => c["categoryName"] == category,
        orElse: () => {"data": []});
    if (sampleIndex < categoryData["data"].length) {
      return categoryData["data"][sampleIndex];
    }
    return null;
  }
}
