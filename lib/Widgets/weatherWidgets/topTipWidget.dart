import 'dart:math';
import 'package:flutter/material.dart';

class TopTipWidget extends StatelessWidget {
  TopTipWidget({super.key});

  // TODO : Get them from online and not write it out like I did
  final List<String> tips = [
    "Water plants early in the morning to reduce evaporation.",
    "Use mulch to keep soil moist and suppress weeds.",
    "Rotate crops each season to maintain soil health.",
    "Deadhead flowers to encourage more blooms.",
    "Compost kitchen scraps to enrich your soil.",
    "Group plants by their watering needs.",
    "Check for pests regularly under leaves.",
  ];

  @override
  Widget build(BuildContext context) {
    final randomTip = tips[Random().nextInt(tips.length)];

    return SizedBox(
      height: 200,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'TOP GARDENING TIP',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              randomTip,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Image.asset(
            'assets/plant2.png',
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
