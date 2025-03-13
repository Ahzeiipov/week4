// lib/EXERCISE-1/main.dart
import '../EXERCISE1/ride_preferences_service.dart';
import '../EXERCISE1/console_log.dart'; // Update this import



void main() {
  var service = RidePreferencesService();
  var logger = ConsoleLogger();

  service.addListener(logger);

  service.selectedPreference("Comfort");
  service.selectedPreference("Economy");
}