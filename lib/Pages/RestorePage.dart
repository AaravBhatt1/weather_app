import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/DeletableCard.dart';

class RestorePage extends StatefulWidget {
  final List<Map<String, dynamic>> unseenItems;

  const RestorePage({super.key, required this.unseenItems});

  @override
  State<RestorePage> createState() => _RestorePageState();
}

class _RestorePageState extends State<RestorePage> {
  final Set<String> selectedKeys = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restore Deleted Cards")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: widget.unseenItems.map((item) {
          final isSelected = selectedKeys.contains(item['key']);

          return DeletableCard(
            key: ValueKey(item['key']),
            child: item['child'],
            height: item['height'] ?? 150.0,
            isDimmed: true,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedKeys.remove(item['key']);
                } else {
                  selectedKeys.add(item['key']);
                }
              });
            },
            onDelete: () {}, // not used on restore page
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final restoredItems = widget.unseenItems
              .where((item) => selectedKeys.contains(item['key']))
              .toList();
          Navigator.pop(context, restoredItems);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
