import 'package:flutter/material.dart';

class PlantEntry {
  final String name;

  PlantEntry({required this.name});
}

class SearchResultsPage extends StatelessWidget {
  final String query;

  final List<PlantEntry> plants = [
    PlantEntry(name: 'Monstera Deliciosa'),
    PlantEntry(name: 'Fiddle Leaf Fig'),
    PlantEntry(name: 'Snake Plant'),
    PlantEntry(name: 'Spider Plant'),
    PlantEntry(name: 'Peace Lily'),
  ];

  SearchResultsPage(this.query, {super.key}) {
    searchresults = plants.where((plant) => plant.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
  
  List<PlantEntry> searchresults = new List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Search Results')),
      body: ListView.builder(
        itemCount: searchresults.length,
        itemBuilder: (context, index) {
          final plant = searchresults[index];
          return ListTile(
            title: Text(plant.name),
          );
        },
      ),
    );
  }
}