import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<String> cities = ['New York', 'London', 'Tokyo', 'Sydney'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.all(30),
        children: [
          for (final city in cities)
            ListTile(
              key: ValueKey(city), // Unique key is required
              title: Text(city),
              // leading: const Icon(Icons.drag_handle),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = cities.removeAt(oldIndex);
            cities.insert(newIndex, item);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can add logic to add a new city
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
