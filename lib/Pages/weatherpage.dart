import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
//          Image.asset(
//            'assets/sun.png',
//            key: const ValueKey('sun'),
//            width: 150,
//            height: 150,
//            fit: BoxFit.contain,
//          ),
//          const SizedBox(height: 20, key: ValueKey('box1')),
          const Text(
            'Welcome to the Weather App!',
            key: ValueKey('text1'),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
              ),
          ),
          const SizedBox(height: 10, key: ValueKey('box2')),
          const Text(
            'Search and get your forecast instantly.',
            key: ValueKey('text2'),
            style: TextStyle(                fontSize: 16,
              color: Colors.grey,
            ),
          ),

          Container(height: 250, color: Colors.blue,  margin: const EdgeInsets.all(16)),
          Container(height: 250, color: Colors.pink, margin: const EdgeInsets.all(16)),
          Container(height: 250, color: Colors.yellow, margin: const EdgeInsets.all(16)),
          Container(height: 250, color: Colors.red, margin: const EdgeInsets.all(16)),


        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can add logic to add a new city
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

