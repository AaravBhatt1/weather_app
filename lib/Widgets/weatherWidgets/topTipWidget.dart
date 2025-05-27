import 'dart:math';
import 'package:flutter/material.dart';

class TopTipWidget extends StatelessWidget {
  TopTipWidget({super.key});

  final List<String> tips = [
    "Water plants early in the morning to reduce evaporation.",
    "Use mulch to keep soil moist and suppress weeds.",
    "Rotate crops each season to maintain soil health.",
    "Deadhead flowers to encourage more blooms.",
    "Compost kitchen scraps to enrich your soil.",
    "Group plants by their watering needs.",
    "Check for pests regularly under leaves."
  ];

  @override
  Widget build(BuildContext context) {
    final randomTip = tips[Random().nextInt(tips.length)];

    return SizedBox(
      height: 150,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.green[100],
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              '🌱 Top Tip:\n\n$randomTip',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
