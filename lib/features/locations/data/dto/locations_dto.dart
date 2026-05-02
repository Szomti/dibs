import 'package:dibs/features/locations/data/dto/location_dto.dart';

class LocationsDto {
  static const _dataKey = 'data';

  final List<LocationDto> items;

  LocationsDto._(Iterable<LocationDto> items)
    : items = List.unmodifiable(items);

  factory LocationsDto.fromJson(Map<String, Object?> jsonObject) {
    final locations = <LocationDto>[];
    final array = jsonObject[_dataKey] as Iterable;
    for (final jsonObject in array.whereType<Map<String, Object?>>()) {
      locations.add(LocationDto.fromJson(jsonObject));
    }
    return LocationsDto._(locations);
  }

  Map<String, Object?> toJson() {
    return {
      _dataKey: [for (final item in items) item.toJson()],
    };
  }
}
