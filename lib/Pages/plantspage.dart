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
        title: Text('My Plant Notifications'),
      ),
      body: ListView(
        children: [
          for (final plant in userPlants)
            ExpansionTile(
              title: Text(plant),
              children: const [
              ],
            )
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
