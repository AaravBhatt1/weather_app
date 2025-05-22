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
      appBar: AppBar(title: const Text('Settings'), backgroundColor: Colors.lightGreen,),
      body: Column(
        children: [
          Row(
            key: const ValueKey("row"),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/sun.png',
                key: const ValueKey('sun'),
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16), 
              const Expanded( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'CAMBRIDGE',
                      key: ValueKey('text1'),
                      style: TextStyle(
                        fontSize: 30,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10, key: ValueKey('box2')),
                    Text(
                      '23°C',
                      key: ValueKey('text2'),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded (
            child: ListView.builder(
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
          )
        ]
      )
    );
  }
}
