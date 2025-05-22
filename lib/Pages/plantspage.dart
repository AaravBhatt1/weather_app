import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import '../Pages/plantpage.dart';

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
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantPage(plantEntry: plant),
                    ),
                  );
                },
                child: Text(plant.name),
              ),
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
