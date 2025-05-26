import 'package:flutter/material.dart';

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
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedKeys.remove(item['key']);
                } else {
                  selectedKeys.add(item['key']);
                }
              });
            },
            child: Card(
              color: item['color'].withOpacity(isSelected ? 1.0 : 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: isSelected ? 6 : 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: item['height'] ?? 150.0,
                  child: Center(
                    child: item['child'] ?? Text(
                      item['label'] ?? 'Unnamed',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ),
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
