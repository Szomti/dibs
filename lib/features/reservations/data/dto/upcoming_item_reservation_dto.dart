import 'package:meta/meta.dart';

import '../../domain/entities/reservation_status.dart';

@immutable
final class UpcomingItemReservationDto {
  static const _idKey = 'id';
  static const _statusKey = 'status';
  static const _reservedAtKey = 'reserved_at';
  static const _reservedUntilKey = 'reserved_until';

  final int id;
  final ReservationStatus status;
  final DateTime reservedAt;
  final DateTime reservedUntil;

  const UpcomingItemReservationDto({
    required this.id,
    required this.status,
    required this.reservedAt,
    required this.reservedUntil,
  });

  factory UpcomingItemReservationDto.fromJson(Map<String, Object?> jsonObject) {
    return UpcomingItemReservationDto(
      id: jsonObject[_idKey] as int,
      status: ReservationStatus.values.byName(jsonObject[_statusKey] as String),
      reservedAt: DateTime.parse(jsonObject[_reservedAtKey] as String).toUtc(),
      reservedUntil: DateTime.parse(
        jsonObject[_reservedUntilKey] as String,
      ).toUtc(),
    );
  }
}
