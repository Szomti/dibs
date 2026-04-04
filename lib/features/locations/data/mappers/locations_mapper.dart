import 'package:dibs/features/locations/data/dto/locations_dto.dart';
import 'package:dibs/features/locations/data/mappers/location_mapper.dart';
import 'package:dibs/features/locations/domain/entities/locations.dart';

extension LocationsDtoMapper on LocationsDto {
  Locations toEntity() {
    return Locations([for (final item in items) item.toEntity()]);
  }
}
