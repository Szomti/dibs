import 'package:dibs/features/locations/data/datasource/locations_local_datasource.dart';
import 'package:dibs/features/locations/data/mappers/locations_mapper.dart';
import 'package:dibs/features/locations/domain/entities/locations.dart';
import 'package:dibs/features/locations/domain/repositories/locations_repository.dart';

class LocationsRepositoryImpl extends LocationsRepository {
  final _localDatasource = LocationsLocalDatasource();

  @override
  Future<Locations?> getLocations() async {
    final locationsDto = await _localDatasource.read();
    if (locationsDto == null) return null;
    return locationsDto.toEntity();
  }
}
