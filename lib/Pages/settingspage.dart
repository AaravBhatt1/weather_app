import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Cannot launch link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<Preferences>(
        builder: (context, prefs, _) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            children: [


              // ********** THEME **********
              const Text('Theme',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: prefs.darkMode,
                onChanged: (v) => prefs.darkMode = v,
              ),
              const Divider(height: 32),

              // ********** UNITS **********
              const Text('Units',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ListTile(
                title: const Text('Temperature Unit'),
                trailing: DropdownButton<bool>(
                  value: prefs.useMetric,
                  items: const [
                    DropdownMenuItem(child: Text('Celsius (°C)'), value: true),
                    DropdownMenuItem(child: Text('Fahrenheit (°F)'), value: false),
                  ],
                  onChanged: (v) {
                    if (v != null) prefs.useMetric = v;
                  },
                ),
              ),
              const Divider(height: 32),

              // ********** ALERTS/NOTIFS **********
              const Text('Alerts & Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SwitchListTile(
                title: const Text('Frost Alerts'),
                value: prefs.frostAlerts,
                onChanged: (v) => prefs.frostAlerts = v,
              ),
              SwitchListTile(
                title: const Text('Rain Alerts'),
                value: prefs.rainAlerts,
                onChanged: (v) => prefs.rainAlerts = v,
              ),
              ListTile(
                title: const Text('Daily Alert Time'),
                subtitle: Text(prefs.alertTime.format(context)),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: prefs.alertTime,
                  );
                  if (picked != null) prefs.alertTime = picked;
                },
              ),
              const Divider(height: 32),

              // // ********** GARDEN LOCATION **********
              const Text('Garden Location',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ListTile(
                title: const Text('Location'),
                subtitle: Text(prefs.gardenLocation),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      final controller = TextEditingController(text: prefs.gardenLocation);
                      return AlertDialog(
                        title: const Text('Set Garden Location'),
                        content: TextField(controller: controller),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              prefs.gardenLocation = controller.text;
                              Navigator.pop(ctx);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(height: 32),

              // // ********** ABOUT **********
              const Text('About',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ListTile(
                title: const Text('About Us'),
                trailing: const Icon(Icons.feedback_outlined),
                onTap: () => launchURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
              ),
            ],
          );
        },
      ),
    );
  }
}