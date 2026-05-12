import '../../domain/entities/location.dart';
import '../../domain/repositories/locations_repository.dart';
import '../datasource/locations_remote_datasource.dart';
import '../mappers/locations_mapper.dart';

class LocationsRepositoryImpl extends LocationsRepository {
  final LocationsRemoteDatasource remoteDatasource;
  final Map<int, Location> _cache = {};

  LocationsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Location>> getLocations({
    required int categoryId,
    required int page,
  }) async {
    final locationsDto = await remoteDatasource.getLocations(categoryId, page);
    final locations = locationsDto.toEntity().items;
    for (final location in locations) {
      _cache[location.id] = location;
    }
    return locations.toList();
  }

  @override
  Location? getByIdOrNull(int id) => _cache[id];

  @override
  Location getByIdOrThrow(int id) => _cache[id]!;
}
