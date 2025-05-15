import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/searchbar.dart';

//TODO: Rename (maybe) and make actual homepage what's in the container
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeatherSearchbar(),
      ),
      body: const Placeholder(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Weather"),
          BottomNavigationBarItem(icon: Icon(Icons.energy_savings_leaf), label: "My Plants"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
