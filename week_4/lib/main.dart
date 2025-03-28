import 'package:flutter/material.dart';
import 'service/ride_prefs_service.dart';
import 'repository/mock/mock_ride_preferences_repository.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'theme/theme.dart';
import 'service/locations_service.dart';
import 'repository/mock/mock_location_repository.dart';

void main() {
  // 1 - Initialize the services
  // RidePrefService.initialize(MockRidePreferencesRepository());
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(MockLocationRepository());

  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
