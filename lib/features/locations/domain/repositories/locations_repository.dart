import '../entities/location.dart';

abstract class LocationsRepository {
  Future<List<Location>> getLocations({
    required int categoryId,
    required int page,
  });

  Location? getByIdOrNull(int id);

  Location getByIdOrThrow(int id);
}
