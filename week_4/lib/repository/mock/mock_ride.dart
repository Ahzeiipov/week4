import '../../model/ride/ride.dart';
import '../../model/user/user.dart';
import '../../model/ride_pref/ride_pref.dart';
import 'ride_repository.dart';
import '../../model/ride/locations.dart';
import '../../screens/ride_pref/widgets/ride_filter.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> rides = [
    Ride(
      departureLocation:
          Location(name: "Battambang", country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
      arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
      driver: User(
          firstName: 'kaknika',
          lastName: 'lala',
          email: 'nika@gmail',
          phone: '145635',
          profilePicture: 'none',
          verifiedProfile: true),
      availableSeats: 2,
      pricePerSeat: 5.0,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: "Battambang", country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 8)),
      arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 10)),
      driver: User(
          firstName: 'chaylim',
          lastName: 'lala',
          email: 'nika@gmail',
          phone: '145635',
          profilePicture: 'none',
          verifiedProfile: true),
      availableSeats: 0,
      pricePerSeat: 5.0,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: "Battambang", country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
          firstName: 'Mengtech',
          lastName: 'lala',
          email: 'nika@gmail',
          phone: '145635',
          profilePicture: 'none',
          verifiedProfile: true),
      availableSeats: 1,
      pricePerSeat: 4.5,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: "Battambang", country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 8)),
      arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 10)),
      driver: User(
          firstName: 'Limhao',
          lastName: 'lala',
          email: 'nika@gmail',
          phone: '145635',
          profilePicture: 'none',
          verifiedProfile: true),

      availableSeats: 2,
      pricePerSeat: 6.0,
      acceptPets: true, // Accepts pets
    ),
    Ride(
      departureLocation:
          Location(name: "Battambang", country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
          firstName: 'Sovanda',
          lastName: 'lala',
          email: 'nika@gmail',
          phone: '145635',
          profilePicture: 'none',
          verifiedProfile: true),
      availableSeats: 1,
      pricePerSeat: 4.5,
      acceptPets: false,
    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return rides.where((ride) {
      bool matchesPreference = ride.departureLocation == preference.departure &&
          ride.arrivalLocation == preference.arrival;

      bool matchesFilter = filter == null ||
          (filter.acceptPets == null || ride.acceptPets == filter.acceptPets);

      return matchesPreference && matchesFilter;
    }).toList();
  }
}
