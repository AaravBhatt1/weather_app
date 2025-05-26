import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class PrecipitationWidget extends StatelessWidget {
  const PrecipitationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final precip = data['current']['precip_mm'];
        return Text(
          'Precipitation: ${precip.toStringAsFixed(1)} mm',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
