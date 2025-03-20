import 'rider_preference_listener.dart';

class RidePreferencesService {
  final List<RiderPreferenceListener> _listeners = [];

  void addListener(RiderPreferenceListener listener) {
    _listeners.add(listener);
  }

  void removeListener(RiderPreferenceListener listener) {
    _listeners.remove(listener);
  }

  void norifyListeners(String preference) {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(preference);
    }
  }

  void selectedPreference(String preference) {
    print("selected preference: $preference");
    norifyListeners(preference);
  }
}
