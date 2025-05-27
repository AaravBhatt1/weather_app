import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

part 'plant.g.dart';
part 'plant.freezed.dart';

@freezed
@HiveType(typeId: 0)
class PlantEntry extends HiveObject with _$PlantEntry {
  
  factory PlantEntry({
    @HiveField(0) required String name,
    @HiveField(4) required String image,
    @HiveField(2) required String type,
    @HiveField(1) required String description,
    @HiveField(3) required Map<String, List<bool>> activities,
  }) = _PlantEntry;
  
  factory PlantEntry.fromJson(Map<String, dynamic> json) => _$PlantEntryFromJson(json);
}


List<PlantEntry> loadPlants() {
  final box = Hive.box<PlantEntry>('plants');
  return box.values.toList();
}

Future<void> importPlantsFromJson() async {
  await Hive.deleteBoxFromDisk('plants');
  final box = await Hive.openBox<PlantEntry>('plants');
  final String jsonString = await rootBundle.loadString('assets/plants.json');
  final List<dynamic> jsonList = json.decode(jsonString);

  final plants = jsonList.map((json) => PlantEntry.fromJson(json)).toList();

  await box.addAll(plants);
}

extension PlantEntryClone on PlantEntry {
  PlantEntry copyDetached() {
    return PlantEntry(
      name: name,
      image: image,
      type: type,
      description: description,
      activities: Map<String, List<bool>>.fromEntries(
        activities.entries.map(
          (e) => MapEntry(e.key, List<bool>.from(e.value)),
        ),
      ),
    );
  }
}