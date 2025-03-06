import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///

enum RideSort { departureTime, price, availbaleSeats }

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}

class RidesService {
  static List<Ride> availableRides = fakeRides;

  // ///
  // ///  Return the relevant rides, given the passenger preferences
  // ///
  // static List<Ride> getRidesFor(RidePreference preferences) {

  //   // For now, just a test
  //   return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
  // }

  static List<Ride> getRide(
      RidePreference preferences, RidesFilter? filter, RideSort? rideSort) {
    List<Ride> rides = availableRides
        .where((ride) =>
            ride.departureDate == preferences.departure &&
            ride.arrivalLocation == preferences.arrival &&
            ride.departureDate.day == preferences.departureDate.day &&
            ride.remainingSeats >= preferences.requestedSeats)
        .toList();

    if (filter?.acceptPets == true) {
      rides = rides.where((rides) => rides.acceptPets).toList();
    }
    if (rideSort != null) {
      rides.sort((a, b) {
        switch (rideSort) {
          case RideSort.departureTime:
            return a.departureDate.compareTo(b.departureDate);
          case RideSort.price:
            return a.pricePerSeat.compareTo(b.pricePerSeat);
          case RideSort.availbaleSeats:
            return a.availableSeats.compareTo(b.availableSeats);
        }
      });
    }
    return rides;
  }
}
