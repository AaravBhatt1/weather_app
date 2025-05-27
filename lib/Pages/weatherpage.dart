import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/currentapibuilder.dart';
import 'package:weather_app/Widgets/weatherWidgets/weatherWidgetsBarrel.dart';
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
      'key': 'locationCard',
      'label': 'Location',
      'color': Colors.brown,
      'child': const LocationWidget(),
      'height': 150.0,
    },
    {
      'key': 'conditionCard',
      'label': 'Weather Condition',
      'color': Colors.grey,
      'child': const WeatherConditionWidget(),
      'height': 300.0,
    },
    {
      'key': 'temperatureCard',
      'label': 'Temperature',
      'color': Colors.deepOrange,
      'child': const TemperatureWidget(),
      'height': 150.0,
    },
    {
      'key': 'topTipCard',
      'label': 'Top Tip',
      'color': Colors.green,
      'child': TopTipWidget(),
      'height': 300.0,
    },
    {
      'key': 'precipitationCard',
      'label': 'Precipitation',
      'color': Colors.blue,
      'child': const PrecipitationWidget(),
      'height': 150.0,
    }
  ];

  final List<Map<String, dynamic>> unseenItems = [
    {
      'key': 'feelsLikeCard',
      'label': 'Feels Like Temp',
      'color': Colors.purple,
      'child': const FeelsLikeTemperatureWidget(),
      'height': 150.0,
    },
    {
      'key': 'pressureCard',
      'label': 'Pressure',
      'color': Colors.deepPurpleAccent,
      'child': const PressureWidget(),
      'height': 200.0,
    },
    {
      'key': 'windCard',
      'label': 'Wind',
      'color': Colors.indigo,
      'child': const WindWidget(),
      'height': 150.0,
    },
    {
      'key': 'uvIndexCard',
      'label': 'UV Index',
      'color': Colors.orange,
      'child': const UVIndexWidget(),
      'height': 150.0,
    },
    {
      'key': 'humidityCard',
      'label': 'Humidity',
      'color': Colors.teal,
      'child': const HumidityWidget(),
      'height': 150.0,
    },
    {
      'key': 'cloudCoverCard',
      'label': 'Cloud Cover',
      'color': Colors.red,
      'child': const CloudCoverWidget(),
      'height': 150.0,
    }
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      unseenItems.add(item); // already includes 'child'
                      items.removeWhere((i) => i['key'] == item['key']);
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