import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class FeelsLikeTemperatureWidget extends StatelessWidget {
  const FeelsLikeTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final feelsLike = data['current']['feelslike_c'];
        return Text(
          'Feels Like: ${feelsLike.round()}°C',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
