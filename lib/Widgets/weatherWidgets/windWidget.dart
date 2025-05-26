import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';


class WindWidget extends StatelessWidget {
  const WindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final windSpeed = data['current']['wind_kph'];
        final windDir = data['current']['wind_dir'];
        return Text(
          'Wind: $windSpeed kph ($windDir)',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
