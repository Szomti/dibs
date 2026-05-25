import 'package:meta/meta.dart';

import 'user_reservation_dto.dart';

@immutable
final class UserReservationsDto {
  static const _dataKey = 'data';

  final List<UserReservationDto> items;

  UserReservationsDto(Iterable<UserReservationDto> items)
    : items = List.unmodifiable(items);

  factory UserReservationsDto.fromJson(Map<String, Object?> jsonObject) {
    final jsonArray = jsonObject[_dataKey] as Iterable<Object?>;
    return UserReservationsDto([
      for (final entry in jsonArray.whereType<Map<String, Object?>>())
        UserReservationDto.fromJson(entry),
    ]);
  }
}
