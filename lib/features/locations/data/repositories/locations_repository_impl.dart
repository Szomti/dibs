import '../../domain/entities/location.dart';
import '../../domain/repositories/locations_repository.dart';
import '../datasource/locations_remote_datasource.dart';
import '../mappers/locations_mapper.dart';

class LocationsRepositoryImpl extends LocationsRepository {
  final LocationsRemoteDatasource remoteDatasource;

  LocationsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Location>> getLocations({
    required int categoryId,
    required int page,
  }) async {
    final locationsDto = await remoteDatasource.getLocations(categoryId, page);
    return locationsDto.toEntity().items.toList();
  }
}
