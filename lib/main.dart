import 'package:flutter/material.dart';
import 'package:weather_app/Abstract/plant.dart';
import 'package:weather_app/Abstract/userplants.dart';
import 'Pages/pagenavigation.dart';
import 'package:weather_app/preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PlantEntryAdapter());
  await importPlantsFromJson();

  await Hive.openBox('preferences');

  await UserPlants().init();

  runApp(
    ChangeNotifierProvider<Preferences>(
      create: (_) => Preferences(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<Preferences>().darkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      // theme: ThemeData.light(),
      theme: ThemeData(
        cardTheme: const CardTheme(
          elevation: 0
        ),
        //scaffoldBackgroundColor: Colors.lightGreen,
        useMaterial3: true,
        //appBarTheme: AppBarTheme(
          //surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          //backgroundColor: Colors.lightGreen,
        //),
        searchBarTheme: const SearchBarThemeData(
          //backgroundColor: WidgetStatePropertyAll(Colors.green),
          elevation: WidgetStatePropertyAll(0),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          //backgroundColor: Colors.green,
          elevation: 0,
        ),
      ),
      home: const PageNavigation(),
    );
  }
}