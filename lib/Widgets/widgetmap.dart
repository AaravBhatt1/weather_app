import "package:flutter/material.dart";
import "package:weather_app/Widgets/temperaturewidget.dart";
import "package:weather_app/Widgets/humiditywidget.dart";

const Map<String, Widget> userWidgets = {
  "Temperature" : TemperatureWidget(),
  "Humidity": HumidityWidget()
};