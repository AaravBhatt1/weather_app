import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'package:weather_app/Abstract/userplants.dart';

class Addplantspage extends StatelessWidget {
  const Addplantspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Add Plants"),
        leading: const BackButton(),
      ),
      body: ListView(
        children: () {
          List<PlantEntry> unnaddedPlants = [];
          List<PlantEntry> myPlants = UserPlants().getAll();
          for (final plant in loadPlants()) {
            if (!myPlants.contains(plant))
              unnaddedPlants.add(plant);
          }
          return unnaddedPlants.map((plantEntry) => ListTile(
            title: Text(plantEntry.name)
          )).toList();
        } ()
      ),
    );
  }
}
