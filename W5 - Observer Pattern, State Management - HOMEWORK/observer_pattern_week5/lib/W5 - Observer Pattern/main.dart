
import '../W5 - Observer Pattern/EXERCISE1/ride_preferences_service.dart';
import '../W5 - Observer Pattern/EXERCISE1/console_log.dart';

void main() {
  var service = RidePreferencesService();
  var logger = ConsoleLogger();

  service.addListener(logger);

  service.selectedPreference("Comfort");
  service.selectedPreference("Economy");
}
