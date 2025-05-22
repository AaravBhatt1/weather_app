import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';
import 'package:weather_app/Widgets/temperaturewidget.dart';
import '../Widgets/DeletableCard.dart';
import 'RestorePage.dart';
import 'dart:math';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

//TODO: Persist the cards so we can add them, and make it so there is a widget
class _WeatherPageState extends State<WeatherPage> {
  final List<Map<String, dynamic>> items = [
    {
      'key': 'temperatureCard',
      'child': const TemperatureWidget(),
      'height': 200.0
    },
  ];
  final List<Map<String, dynamic>> unseenItems = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather")
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ReorderableListView(
          padding: const EdgeInsets.all(30),
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
                child: item['child'],
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