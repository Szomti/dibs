import 'package:meta/meta.dart';

import 'upcoming_item_reservation_dto.dart';

@immutable
final class UpcomingItemReservationsDto {
  static const _dataKey = 'data';

  final List<UpcomingItemReservationDto> items;

  UpcomingItemReservationsDto._(Iterable<UpcomingItemReservationDto> items)
    : items = List.unmodifiable(items);

  factory UpcomingItemReservationsDto.fromJson(
    Map<String, Object?> jsonObject,
  ) {
    final jsonArray = jsonObject[_dataKey] as Iterable<Object?>;
    return UpcomingItemReservationsDto._([
      for (final entry in jsonArray.whereType<Map<String, Object?>>())
        UpcomingItemReservationDto.fromJson(entry),
    ]);
  }
}
