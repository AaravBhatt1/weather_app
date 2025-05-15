import 'package:flutter/material.dart';
import 'package:weather_app/Pages/weatherpage.dart';
import 'package:weather_app/Widgets/searchbar.dart';

class PageNavigation extends StatelessWidget {
  const PageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeatherSearchbar(),
      ),
      body: const Weatherpage(),
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
