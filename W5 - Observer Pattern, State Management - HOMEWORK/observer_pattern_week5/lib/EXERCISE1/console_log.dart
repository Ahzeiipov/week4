import 'rider_preference_listener.dart';

class ConsoleLogger implements RiderPreferenceListener {
  @override
  void onPreferenceSelected(String selectedPreference) {
    print("Console Logger: Preference updated to $selectedPreference");
  }
}