import 'package:dibs/features/locations/data/datasource/locations_remote_datasource.dart';
import 'package:dibs/features/locations/data/mappers/locations_mapper.dart';
import 'package:dibs/features/locations/domain/repositories/locations_repository.dart';

import '../../domain/entities/location.dart';

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
