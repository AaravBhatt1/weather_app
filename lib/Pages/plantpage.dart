import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';

class PlantPage extends StatelessWidget {
  final PlantEntry plantEntry;

  const PlantPage({Key? key, required this.plantEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = plantEntry.name[0].toUpperCase() + plantEntry.name.substring(1);

    // Enable scrolling for the page content
    // No additional code needed here, just wrap the body in SingleChildScrollView below.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: const BackButton(),
            stretch: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(name),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Image.network(
                plantEntry.image,
                height: 300,
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ExpandableText(
                    plantEntry.description,
                    maxLines: 6,
                    expandText: 'Show More',
                    collapseText: 'Show Less',
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'When to plant',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                      5: FlexColumnWidth(1),
                      6: FlexColumnWidth(1),
                      7: FlexColumnWidth(1),
                      8: FlexColumnWidth(1),
                      9: FlexColumnWidth(1),
                      10: FlexColumnWidth(1),
                      11: FlexColumnWidth(1),
                      12: FlexColumnWidth(1),
                    },
                    children: [
                      const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              'Activity',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('J', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('F', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('M', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('A', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('M', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('J', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('J', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('A', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('S', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('O', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('N', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('D', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      ...plantEntry.activities.entries
                          .where((entry) => entry.key != "")
                          .map((entry) => TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(entry.key),
                          ),
                          ...List.generate(
                            12,
                                (i) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              child: i < entry.value.length
                                  ? Icon(
                                entry.value[i] ? Icons.check_circle : Icons.cancel,
                                color: entry.value[i] ? Colors.green : Colors.red,
                                size: 25,
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
        ],
      ),
    );
  }
}