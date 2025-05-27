import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/apibuilder.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: ApiBuilder(
        builder: (context, data) {
          final pressure = data['current']['pressure_mb'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pressure.png', // ← Make sure you have this icon
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${pressure.toStringAsFixed(0)} mb',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Pressure',
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
