import 'package:meta/meta.dart';

import 'location_dto.dart';

@immutable
final class LocationsDto {
  static const _dataKey = 'data';

  final List<LocationDto> items;

  LocationsDto._(Iterable<LocationDto> items)
    : items = List.unmodifiable(items);

  factory LocationsDto.fromJson(Map<String, Object?> jsonObject) {
    final jsonArray = jsonObject[_dataKey] as Iterable;
    return LocationsDto._([
      for (final jsonObject in jsonArray.whereType<Map<String, Object?>>())
        LocationDto.fromJson(jsonObject),
    ]);
  }

  Map<String, Object?> toJson() {
    return {
      _dataKey: [for (final item in items) item.toJson()],
    };
  }
}
