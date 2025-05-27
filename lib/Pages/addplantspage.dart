import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'package:weather_app/Abstract/userplants.dart';

class Addplantspage extends StatefulWidget {
  const Addplantspage({super.key});

  @override
  State<Addplantspage> createState() => _AddplantspageState();
}

class _AddplantspageState extends State<Addplantspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title:  const Text("Add Plants"),
      ),
      body: ListView(
        children: () {
          List<PlantEntry> allPlants = loadPlants();
          List<String> myPlants = UserPlants().getAll();
          return allPlants.map(
              (p) => CheckboxListTile(
                  title: Text(p.name),
                  value: myPlants.contains(p.name),
                  onChanged: (newValue) {
                    if (newValue == null) return;
                    if (newValue) {
                      setState(() {
                        UserPlants().addPlant(p.name);
                      });
                    } else {
                      setState(() {
                        UserPlants().removePlant(p.name);
                      });
                    }
                  }
              )
          ).toList();
        } ()
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
