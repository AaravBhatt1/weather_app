import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final humidity = data['current']['humidity'];
        return Text(
          'Humidity: $humidity%',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
