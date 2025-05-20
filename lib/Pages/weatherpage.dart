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
          /* for (final city in cities)
            ListTile(
              key: ValueKey(city), // Unique key is required
              title: Text(city),
              // leading: const Icon(Icons.drag_handle),
            ), */
          Row(
            key: ValueKey('row'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/sun.png',
                key: const ValueKey('sun'),
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16), // Space between image and text
              const Expanded( // Make sure the text doesn’t overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'CAMBRIDGE',
                      key: ValueKey('text1'),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //TODO: replace 'DEG' with the current temperature
                    Text(
                      'DEG',
                      key: ValueKey('text2'),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),

        //stuff here

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

