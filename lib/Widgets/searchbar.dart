import 'package:flutter/material.dart';
import '../Abstract/plant.dart';
import '../Pages/plantpage.dart';

class WeatherSearchbar extends StatelessWidget {
  const WeatherSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
  return SearchAnchor.bar(
    barHintText: "Search for information abouts Plants Here",
    viewHintText: "Search for information abouts Plants Here",
    suggestionsBuilder: (BuildContext context, SearchController controller) async {
      final plants = loadPlants()
          .where((PlantEntry e) => e.name.toLowerCase().contains(controller.text.toLowerCase()))
          .toList();

      return plants.map((PlantEntry e) => ListTile(
        //leading: Image.network(e.image, width: 50),
        title: Text(e.name),
        subtitle: Text(e.type),
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantPage(plantEntry: e),
          ),
        );
        },
      ));
    },
    onSubmitted: (String value) {
      final plants = loadPlants()
          .where((PlantEntry e) => e.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if (plants.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantPage(plantEntry: plants.first),
          ),
        );
      }
    },
  );
  }
}