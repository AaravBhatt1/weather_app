import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Widgets/currentapibuilder.dart';
import 'package:weather_app/preferences.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<Preferences>(context);

    return SizedBox(
      height: 200,
      width: 300,
      child: CurrentWeatherApiBuilder(
        builder: (context, data) {
          final condition = data['current']['condition']['text'];
          final iconUrl = "https:${data['current']['condition']['icon']}";

          final isMetric = prefs.useMetric;
          final temp = isMetric ? data['current']['temp_c'] : data['current']['temp_f'];
          final feelsLike = isMetric ? data['current']['feelslike_c'] : data['current']['feelslike_f'];
          final unit = isMetric ? '°C' : '°F';

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
                'Actual: ${temp.round()}$unit',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Feels like: ${feelsLike.round()}$unit',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}

