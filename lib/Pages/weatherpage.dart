import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<String> weather_options = ['Temperature', 'Humidity', 'Wind Gust', 'Precipitation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.all(30),
        children: [
          Image.asset(
            'assets/sun.png',
            key: const ValueKey('sun'),
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20, key: ValueKey('box1')),
          const Text(
            'Welcome to the Weather App!',
            key: ValueKey('text1'),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
              ),
          ),
          const SizedBox(height: 10, key: ValueKey('box2')),
          const Text(
            'Search and get your forecast instantly.',
            key: ValueKey('text2'),
            style: TextStyle(                fontSize: 16,
              color: Colors.grey,
            ),
          ),

          for (final city in weather_options)
            ListTile(
              key: ValueKey(city), // Unique key is required
              title: Text(city),
              tileColor: Colors.green.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
              ),
              // leading: const Icon(Icons.drag_handle),
            ),

        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final item = weather_options.removeAt(oldIndex);
            weather_options.insert(newIndex, item);
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

