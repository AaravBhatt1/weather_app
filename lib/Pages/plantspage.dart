import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';

List<PlantEntry> testPlants = plants;

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  final List<PlantEntry> userPlants = plants;


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
