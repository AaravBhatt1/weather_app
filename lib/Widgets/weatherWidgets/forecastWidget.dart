import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Widgets/futureapibuilder.dart';
import 'package:weather_app/preferences.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = Provider.of<Preferences>(context);
    final useMetric = prefs.useMetric;
    return SizedBox(
      height: 200,
      width: 300,
      child: FutureWeatherApiBuilder(
        builder: (context, data) {
          final forecastDays = data['forecast']['forecastday'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '5-Day Forecast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecastDays.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final day = forecastDays[index];
                    final date = day['date'];
                    final parts = date.substring(5).split('-');
                    final ukDate = '${parts[1]}-${parts[0]}';
                    final iconUrl = "https:${day['day']['condition']['icon']}";
                    final avgTemp = useMetric
                        ? day['day']['avgtemp_c']
                        : day['day']['avgtemp_f'];
                    final unit = useMetric ? '°C' : '°F';
                    final condition = day['day']['condition']['text'];

                    return Container(
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ukDate,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(
                            iconUrl,
                            width: 40,
                            height: 40,
                            errorBuilder: (_, __, ___) => const Icon(Icons.cloud),
                          ),
                          Text(
                            '${avgTemp.round()}$unit',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            condition,
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
