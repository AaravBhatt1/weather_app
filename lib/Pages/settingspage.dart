import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ExpansionTileController controller = ExpansionTileController();
  final List<String> subsections = [
    'Notification Settings',
    'Theme / Appearance',
    'Numerical Settings',
  ];
  // One controller per tile:
  late final List<ExpansionTileController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List<ExpansionTileController>.generate(
      subsections.length,
      (_) => ExpansionTileController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView.builder(
        itemCount: subsections.length,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              controller: _controllers[index],
              title: Text(subsections[index]),
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Contents of "${subsections[index]}"',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
