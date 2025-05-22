import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final List<Map<String, dynamic>> items = [
    {'key': 'blue', 'color': Colors.blue, 'label': 'Blue bbbb'},
    {'key': 'pink', 'color': Colors.pink, 'label': 'Pink ppp'},
    {'key': 'yellow', 'color': Colors.yellow, 'label': 'Yellow yyyy'},
    {'key': 'red', 'color': Colors.red, 'label': 'Red rrrr'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        padding: const EdgeInsets.all(30),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            // Skip static top widgets (0, 1, 2, 3)
            const staticCount = 4;
            if (oldIndex < staticCount || newIndex <= staticCount) return;

            final item = items.removeAt(oldIndex - staticCount);
            items.insert(newIndex - staticCount, item);
          });
        },
        children: [
          const Image(
            key: ValueKey('sun'),
            image: AssetImage('assets/sun.png'),
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            key: ValueKey('spacer1'),
            height: 20,
          ),
          const Text(
            'Welcome to the Weather App!!',
            key: ValueKey('welcome'),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            key: ValueKey('spacer2'),
            height: 10,
          ),
          const Text(
            'Search and get your forecast instantly.',
            key: ValueKey('subtitle'),
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          // Now the reorderable cards
          for (var item in items)
            Card(
              key: ValueKey(item['key']),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 4,
              color: item['color'],
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    item['label'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: add new cards
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
