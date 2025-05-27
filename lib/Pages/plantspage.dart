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
  List<String> userPlants = UserPlants().getAll();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plants'),
      ),
      body: ListView(
        children: [
          for (final plantName in userPlants)
            ListTile(
              title: Text("${plantName[0].toUpperCase()}${plantName.substring(1)}"),
              onTap: () {
                final plant = testPlants.firstWhere((p) => p.name == plantName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlantPage(plantEntry: plant),
                  ),
                );
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addplantspage())).then(
                (v) async {
                  dynamic x = await v;
                  userPlants = UserPlants().getAll();
                  setState(() {});
                }
            );
          }
      ),
    );
  }
}

