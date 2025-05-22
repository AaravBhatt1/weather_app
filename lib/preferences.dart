import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Preferences extends ChangeNotifier {
  Box preferences = Hive.box('preferences');
  bool _darkMode = false;
  bool _useMetric = true;
  bool _frostAlerts = true;
  bool _rainAlerts = true;
  TimeOfDay _alertTime = const TimeOfDay(hour: 7, minute: 0);
  String _gardenLocation = 'Current GPS Location';

  // ── THEME ───────────────────────────────────────
  bool get darkMode => _darkMode;
  set darkMode(bool val) {
    if (val == _darkMode) return;
    _darkMode = val;
    notifyListeners();
  }

  // ── UNITS ───────────────────────────────────────
  bool get useMetric => _useMetric;
  String get tempUnitLabel => _useMetric ? '°C' : '°F';
  set useMetric(bool val) {
    if (val == _useMetric) return;
    _useMetric = val;
    notifyListeners();
  }

  // ── ALERTS ──────────────────────────────────────
  bool get frostAlerts => _frostAlerts;
  set frostAlerts(bool val) {
    if (val == _frostAlerts) return;
    _frostAlerts = val;
    notifyListeners();
  }

  bool get rainAlerts => _rainAlerts;
  set rainAlerts(bool val) {
    if (val == _rainAlerts) return;
    _rainAlerts = val;
    notifyListeners();
  }

  TimeOfDay get alertTime => _alertTime;
  set alertTime(TimeOfDay val) {
    _alertTime = val;
    notifyListeners();
  }

  // ── LOCATION ────────────────────────────────────
  String get gardenLocation => _gardenLocation;
  set gardenLocation(String val) {
    _gardenLocation = val;
    notifyListeners();
  }
}