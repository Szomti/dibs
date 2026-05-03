import '../../domain/entities/locations.dart';
import '../dto/locations_dto.dart';
import 'location_mapper.dart';

extension LocationsDtoMapper on LocationsDto {
  Locations toEntity() {
    return Locations([for (final item in items) item.toEntity()]);
  }
}
