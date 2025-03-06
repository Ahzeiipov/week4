import '../model/ride/locations.dart';

// import '../dummy_data/dummy_data.dart';
import '../repository/mock/location_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  // static const List<Location> availableLocations = fakeLocations;
  static LocationsService? _instance;
  final LocationRepository repository;
    LocationsService._internal(this.repository){}

  static void initialize(LocationRepository repository) {
    if (_instance == null) {
      _instance =LocationsService._internal(repository);
    } else {
      throw Exception("LocationService is already initialized.");
    }
  }

  static LocationsService get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      throw Exception("LocationService is not initialized.");
    }
  }


  List<Location> getLocations() {
    return repository.getLocations();
  }



}
