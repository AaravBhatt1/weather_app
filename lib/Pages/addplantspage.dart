import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'package:weather_app/Abstract/userplants.dart';

class Addplantspage extends StatefulWidget {
  const Addplantspage({super.key});

  @override
  State<Addplantspage> createState() => _AddplantspageState();
}

class _AddplantspageState extends State<Addplantspage> {
  List<String> addedSettings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Add Plants"),
        leading: const BackButton(),
      ),
      body: ListView(
        children: () {
          List<String> myPlants = UserPlants().getAll();
          return loadPlants().map((plant) => CheckboxListTile(
              title: Text(plant.name),
              value: myPlants.contains(plant.name),
              onChanged: (b) {
                setState(() {
                  if (b == null) return;
                  if (b) {UserPlants().addPlant(plant.name);}
                      else UserPlants().deletePlant(plant.name);
                });
              }
          )).toList();
        } ()
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.check),
      ),
    );
  }
}
