import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';
import '../Widgets/DeletableCard.dart';
import 'RestorePage.dart';
import 'dart:math';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final List<Map<String, dynamic>> items = [
    {'key': 'blueCard', 'color': Colors.blue, 'label': 'Blue', 'height': 200.0},
    {'key': 'pinkCard', 'color': Colors.pink, 'label': 'Pink', 'height': 300.0},
    {
      'key': 'yellowCard',
      'color': Colors.yellow,
      'label': 'Yellow',
      'height': 100.0
    },
    {'key': 'greyCard', 'color': Colors.grey, 'label': 'Grey', 'height': 150.0}
  ];
  final List<Map<String, dynamic>> unseenItems = [
    {
      'key': 'orangeCard',
      'color': Colors.orange,
      'label': 'Orange',
      'height': 300.0
    },
    {
      'key': 'greenCard',
      'color': Colors.green,
      'label': 'Green',
      'height': 160.0
    },
    {
      'key': 'purpleCard',
      'color': Colors.purple,
      'label': 'Purple',
      'height': 200.0
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApiBuilder(
        builder: (context, data) {
          return SafeArea(
            child: Container(
              color: Colors.lightGreen,
              child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/sun.png',
                            key: const ValueKey('sun'),
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CAMBRIDGE',
                                  key: ValueKey('text1'),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10, key: ValueKey('box2')),
                                Text(
                                  '23°C',
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
                    ), 

                  Expanded(
                    child: ReorderableListView(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          final item = items.removeAt(oldIndex);
                          items.insert(
                              newIndex > oldIndex ? newIndex - 1 : newIndex,
                              item);
                        });
                      },
                      children: [
                        for (var item in items)
                          DeletableCard(
                            key: ValueKey(item['key']),
                            color: item['color'],
                            label: item['label'],
                            height: item['height'],
                            onDelete: () {
                              setState(() {
                                unseenItems.add(item);
                                items.removeWhere((i) =>
                                i['key'] == item['key']);
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          );

          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final restored = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestorePage(unseenItems: unseenItems),
            ),
          );

          if (restored != null && restored is List<Map<String, dynamic>>) {
            setState(() {
              items.addAll(restored);
              unseenItems.removeWhere((d) =>
                  restored.any((r) => r['key'] == d['key']));
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}