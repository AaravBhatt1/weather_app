import 'package:flutter/material.dart';
import 'package:weather_app/Pages/plantspage.dart';
import 'package:weather_app/Pages/weatherpage.dart';
import 'package:weather_app/Widgets/searchbar.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({super.key});

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  int pageIndex = 0;
  List<NavigationDestination> navBarDestinations = const [
    NavigationDestination(icon: Icon(Icons.cloud), label: "Weather"),
    NavigationDestination(icon: Icon(Icons.notifications), label: "My Plants"), // TODO: Add badges
    NavigationDestination(icon: Icon(Icons.settings), label: "Settings")
  ];
  final List<Widget> pages = const [
    WeatherPage(),
    PlantPage(),
    Placeholder()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeatherSearchbar(),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: pages[pageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: pageIndex,
        destinations: navBarDestinations,
        onDestinationSelected: (int index) => setState(() {
          pageIndex = index;
        }),
      ),
    );
  }
}
