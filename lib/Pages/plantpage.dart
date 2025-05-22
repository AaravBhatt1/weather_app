import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';

class PlantPage extends StatelessWidget {
  final PlantEntry plantEntry;

  const PlantPage({Key? key, required this.plantEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Enable scrolling for the page content
    // No additional code needed here, just wrap the body in SingleChildScrollView below.
    return Scaffold(
      appBar: AppBar(
        title: Text(plantEntry.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: (plantEntry.image != null && plantEntry.image.isNotEmpty)
                    ? Image.network(
                        plantEntry.image,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: Icon(Icons.local_florist, size: 100),
                      ),
              ),
              const SizedBox(height: 24),
              Text(
                plantEntry.name,
              ),
              const SizedBox(height: 16),
              Text(
                plantEntry.description,
              ),
              const SizedBox(height: 24),
              Text(
                'When to plant',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                  5: FlexColumnWidth(),
                  6: FlexColumnWidth(),
                  7: FlexColumnWidth(),
                  8: FlexColumnWidth(),
                  9: FlexColumnWidth(),
                  10: FlexColumnWidth(),
                  11: FlexColumnWidth(),
                  12: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Activity',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Jan', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Feb', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Mar', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Apr', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('May', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Jun', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Jul', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Aug', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Sep', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Oct', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Nov', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Dec', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  ...plantEntry.activities.entries
                      .where((entry) => entry.key != "")
                      .map((entry) => TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(entry.key),
                              ),
                              ...List.generate(
                                12,
                                (i) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: i < entry.value.length
                                      ? Icon(
                                          entry.value[i] ? Icons.check_circle : Icons.cancel,
                                          color: entry.value[i] ? Colors.green : Colors.red,
                                          size: 20,
                                        )
                                      : const SizedBox(width: 20),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}