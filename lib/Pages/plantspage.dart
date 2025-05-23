import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'package:weather_app/Abstract/userplants.dart';
import 'package:weather_app/Pages/addplantspage.dart';
import '../Pages/plantpage.dart';

List<PlantEntry> testPlants = loadPlants();

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  final List<PlantEntry> userPlants = UserPlants().getAll();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Plant Notifications'),
      ),
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
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addplantspage()))
      ),
    );
  }
}
