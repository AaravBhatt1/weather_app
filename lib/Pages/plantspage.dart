import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';

List<PlantEntry> testPlants = loadPlants();

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  final List<PlantEntry> userPlants = loadPlants();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (final plant in userPlants)
            ExpansionTile(
              title: Text(plant.name),
              children: const [
                Text("Test")
              ],
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {}
      ),
    );
  }
}
