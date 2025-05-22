import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';

class PlantPage extends StatelessWidget {
  final PlantEntry plantEntry;

  const PlantPage({Key? key, required this.plantEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plantEntry.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Center(
              child: plantEntry.imageUrl.isNotEmpty
                  ? Image.network(
                      plantEntry.imageUrl,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.local_florist, size: 100),
                    ),
            ),*/
            const SizedBox(height: 24),
            Text(
              plantEntry.name,
            ),
            const SizedBox(height: 16),
            Text(
              plantEntry.description,
            ),
          ],
        ),
      ),
    );
  }
}