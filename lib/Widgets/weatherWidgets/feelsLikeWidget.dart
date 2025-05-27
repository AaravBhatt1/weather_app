import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Widgets/currentapibuilder.dart';
import 'package:weather_app/preferences.dart';

class FeelsLikeTemperatureWidget extends StatelessWidget {
  const FeelsLikeTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<Preferences>(context);
    return CurrentWeatherApiBuilder(
      builder: (context, data) {
        final isMetric = prefs.useMetric;
        final feelsLike = isMetric ? data['current']['feelslike_c'] : data['current']['feelslike_f'];
        final unit = isMetric ? '°C' : '°F';
        return Text(
          'Feels Like: ${feelsLike.round()}$unit',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
