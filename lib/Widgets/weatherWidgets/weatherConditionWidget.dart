import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';


class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final condition = data['current']['condition']['text'];
        final iconUrl = "https:${data['current']['condition']['icon']}";

        return Row(
          children: [
            Image.network(
              iconUrl,
              width: 60,
              height: 60,
              errorBuilder: (_, __, ___) => const Icon(Icons.cloud),
            ),
            const SizedBox(width: 12),
            Text(
              condition,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
