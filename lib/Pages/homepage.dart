import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/searchbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WeatherSearchbar(),
        actions: const [
          IconButton(onPressed: () => {}, icon: Icon(Icons.settings))
        ]
      ),
    );
  }
}
