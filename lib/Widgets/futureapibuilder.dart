import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureWeatherApiBuilder extends StatelessWidget {
  const FutureWeatherApiBuilder({super.key, required this.builder});

  final Widget Function(BuildContext, Map) builder;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder(
            future: http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=c48cd3f6bb9941ba83c132239252205&q=Cambridge&days=5&aqi=no&alerts=yes')),
            builder: (context, future) {
              if (future.hasData) {
                Map data = jsonDecode(future.data!.body);
                return builder(context, data);
              }
              return const CircularProgressIndicator();
            }
        )
    );
  }
}
