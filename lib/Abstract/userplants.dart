import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/Abstract/plant.dart';

//TODO: Replace String with some unique id

class UserPlants {
  UserPlants._internal();

  late final Box<String> _box;
  static final UserPlants _instance = UserPlants._internal();
  final String boxName = "UserPlants";

  factory UserPlants() {

    return _instance;
  }

  Box get box => _box;

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox(boxName);
    } else {
      _box = Hive.box(boxName);
    }
  }

  List<String> getAll() {
    return _box.values.toList();
  }

  void addPlant(String entry) {
    _box.add(entry);
  }

  void deletePlant(String entry) {
    _box.delete(entry);
  }
}