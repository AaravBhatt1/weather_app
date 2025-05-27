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
  List<PlantEntry> userPlants = [];

  @override
  void initState() {
    super.initState();
    _loadUserPlants();
  }

  void _loadUserPlants() {
    setState(() {
      userPlants = UserPlants().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Plant Notifications'),
      ),
      body: userPlants.isEmpty
          ? const Center(child: Text("No plants added yet."))
          : ListView.builder(
              itemCount: userPlants.length,
              itemBuilder: (context, index) {
                final plant = userPlants[index];
                return ExpansionTile(
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
                  //children: const [
                  //  Text("Test"),
                  //],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Addplantspage()),
          );
          _loadUserPlants();
        },
      ),
    );
  }
}

