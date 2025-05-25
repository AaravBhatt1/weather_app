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
  @override
  Widget build(BuildContext context) {
    List<String> userPlants = UserPlants().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Plant Notifications'),
      ),
      body: ListView(
        children: [
          for (final plant in loadPlants())
            if (userPlants.contains(plant.name))
            ExpansionTile(
              // TODO: Move gesture detector outside
              title: GestureDetector(
                onLongPress: () {
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
          child: const Icon(Icons.edit),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addplantspage()))
      ),
    );
  }
}
