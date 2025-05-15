import 'package:flutter/material.dart';
import '../Pages/searchresults.dart';

class WeatherSearchbar extends StatelessWidget {
  const WeatherSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
return SearchBar(
  hintText: "Ask Questions about Plants Here",
  onSubmitted: (query) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(query), // Replace Placeholder with your target widget
      ),
    );
  },
);
  }
}