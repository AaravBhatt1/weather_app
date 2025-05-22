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
    @HiveField(1) required String img,
    @HiveField(2) required String family,
  }) = _PlantEntry;
  
  factory PlantEntry.fromJson(Map<String, dynamic> json) => _$PlantEntryFromJson(json);
}

final List<PlantEntry> plants = [
  PlantEntry(name: 'Monstera Deliciosa', img: "https://florastore.com/cdn/shop/files/1711701_Atmosphere_04_SQ_MJ.jpg?v=1734605508&width=1080", family: "Araceae"),
  PlantEntry(name: 'Fiddle Leaf Fig', img: "https://www.beardsanddaisies.co.uk/cdn/shop/products/BD_H_M_498_5ee4a425-1530-4a0b-bd9a-d93c530eb0ec_720x.jpg?v=1679491111", family: "Moraceae"),
  PlantEntry(name: 'Snake Plant', img: "https://media.houseandgarden.co.uk/photos/6736030759a56cf43ffed622/master/w_1600%2Cc_limit/517540986", family: "Asparagus"),
  PlantEntry(name: 'Spider Plant', img: "https://media.houseandgarden.co.uk/photos/66e02c4143ff56cb528fe5b6/master/w_1600%2Cc_limit/08-01-24-HG-Crisp242.jpg", family: "Asparagaceae"),
  PlantEntry(name: 'Peace Lily', img: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQikKQzzOVUljg7EapNRaVLxBVfTOBSsuchbWADXI1t4eVtXMOAOQCyjgwlbVqew9-aFQZcZ_qmlK6hkvwHIif7IQ", family: "Araceae",),
];

List<PlantEntry> loadPlants() {
  final box = Hive.box<PlantEntry>('plants');
  return box.values.toList();
}

Future<void> importPlantsFromJson() async {
  final box = await Hive.openBox<PlantEntry>('plants');
  final String jsonString = await rootBundle.loadString('assets/plants.json');
  final List<dynamic> jsonList = json.decode(jsonString);

  final plants = jsonList.map((json) => PlantEntry.fromJson(json)).toList();

  await box.addAll(plants);
}
