import 'package:flutter/material.dart';
import '../Abstract/plant.dart';

class WeatherSearchbar extends StatelessWidget {
  const WeatherSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
  return SearchAnchor.bar(
    viewHintText: "Search for information abouts Plants Here",
    suggestionsBuilder: (BuildContext context, SearchController controller) async {
      return plants.where((PlantEntry e) => e.name.toLowerCase().contains(controller.text.toLowerCase())).map((PlantEntry e) => ListTile(
        leading: Image.network(e.img),
        title: Text(e.name),
        subtitle: Text(e.family),
        )
      );
    },
  );
  }
}