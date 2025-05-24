import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: ApiBuilder(
        builder: (context, data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/humidity.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Text(
                '${data['current']['humidity']}%',
                style: const TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
