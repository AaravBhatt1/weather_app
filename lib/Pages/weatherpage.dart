import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Use reorderable list view
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Text("Stuff will go here", style: Theme.of(context).textTheme.headlineLarge,)
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
