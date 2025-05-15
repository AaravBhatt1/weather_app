import 'package:flutter/material.dart';
import 'Pages/pagenavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
        searchBarTheme: const SearchBarThemeData(
          elevation: WidgetStatePropertyAll(0),

        )
      ),
      home: const PageNavigation(),
    );
  }
}