import '../entities/location.dart';

abstract class LocationsRepository {
  Future<List<Location>> getLocations({required int categoryId, required int page});
}
