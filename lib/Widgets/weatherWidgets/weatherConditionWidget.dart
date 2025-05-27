import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: ApiBuilder(
        builder: (context, data) {
          final condition = data['current']['condition']['text'];
          final iconUrl = "https:${data['current']['condition']['icon']}";
          final temp = data['current']['temp_c'];
          final feelsLike = data['current']['feelslike_c'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                iconUrl,
                width: 64,
                height: 64,
                errorBuilder: (_, __, ___) => const Icon(Icons.cloud, size: 64),
              ),
              const SizedBox(height: 12),
              Text(
                condition,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Actual: ${temp.round()}°C',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Feels like: ${feelsLike.round()}°C',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}

