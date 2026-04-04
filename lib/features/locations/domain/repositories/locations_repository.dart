import 'package:dibs/features/locations/domain/entities/locations.dart';

abstract class LocationsRepository {
  Future<Locations?> getLocations();
}
