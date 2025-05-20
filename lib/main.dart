import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'Pages/pagenavigation.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PlantEntryAdapter());
  await importPlantsFromJson();

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
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
        ),
      ),
      home: const PageNavigation(),
    );
  }
}