import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Widgets/currentapibuilder.dart';
import 'package:weather_app/preferences.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<Preferences>(context);

    return SizedBox(
      height: 200,
      width: 300,
      child: CurrentWeatherApiBuilder(
        builder: (context, data) {
          final isMetric = prefs.useMetric;
          final temp = isMetric ? data['current']['temp_c'] : data['current']['temp_f'];
          final unit = isMetric ? '°C' : '°F';
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/thermometer.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${temp.round()}$unit',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
