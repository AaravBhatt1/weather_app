import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: ApiBuilder(
        builder: (context, data) {
          return Container (
            padding: const EdgeInsets.only(top: 10.0),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                'https:${data['current']['condition']['icon']}',
                width: 100,
                height: 100,
              ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['location']['name'].toUpperCase(),
                        style: const TextStyle( // TODO: Use theming
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${data['current']['temp_c'].round()}°C',
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            )
          );
        }
      ),
    );
  }
}
