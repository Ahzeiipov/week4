import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../screens/ride_pref/widgets/ride_filter.dart';


abstract class RidesRepository {
  List<Ride> getRides(RidePreference preference, RidesFilter? filter);
}
