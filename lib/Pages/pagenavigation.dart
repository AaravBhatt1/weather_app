import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/searchbar.dart';

//TODO: Rename (maybe) and make actual homepage what's in the container
class PageNavigation extends StatelessWidget {
  const PageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeatherSearchbar(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: const Placeholder(),
      bottomNavigationBar: BottomNavigationB:drawer: ,ar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Weather"),
          BottomNavigationBarItem(icon: Icon(Icons.energy_savings_leaf), label: "My Plants"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
