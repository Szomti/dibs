import 'package:meta/meta.dart';

import '../../../items/data/dto/simplified_item_dto.dart';
import '../../domain/entities/reservation_status.dart';

@immutable
final class UserReservationDto {
  static const _idKey = 'id';
  static const _statusKey = 'status';
  static const _itemKey = 'item';
  static const _reservedAtKey = 'reserved_at';
  static const _reservedUntilKey = 'reserved_until';
  static const _returnedAtKey = 'returned_at';

  final int id;
  final ReservationStatus status;
  final SimplifiedItemDto simplifiedItem;
  final DateTime reservedAt;
  final DateTime reservedUntil;
  final DateTime? returnedAt;

  const UserReservationDto({
    required this.id,
    required this.status,
    required this.simplifiedItem,
    required this.reservedAt,
    required this.reservedUntil,
    required this.returnedAt,
  });

  factory UserReservationDto.fromJson(Map<String, Object?> jsonObject) {
    final returnedAt = jsonObject[_returnedAtKey] as String?;
    return UserReservationDto(
      id: jsonObject[_idKey] as int,
      status: ReservationStatus.values.byName(jsonObject[_statusKey] as String),
      simplifiedItem: SimplifiedItemDto.fromJson(
        jsonObject[_itemKey] as Map<String, Object?>,
      ),
      reservedAt: DateTime.parse(jsonObject[_reservedAtKey] as String).toUtc(),
      reservedUntil: DateTime.parse(
        jsonObject[_reservedUntilKey] as String,
      ).toUtc(),
      returnedAt: returnedAt == null
          ? null
          : DateTime.parse(returnedAt).toUtc(),
    );
  }
}
