import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class UVIndexWidget extends StatelessWidget {
  const UVIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiBuilder(
      builder: (context, data) {
        final uv = data['current']['uv'];
        return Text(
          'UV Index: $uv',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
