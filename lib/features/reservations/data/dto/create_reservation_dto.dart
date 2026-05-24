import 'package:meta/meta.dart';

@immutable
final class CreateReservationDto {
  static const _itemIdKey = 'item_id';
  static const _reservedFromKey = 'reserved_from';
  static const _reservedUntilKey = 'reserved_until';

  final int itemId;
  final DateTime reservedFrom;
  final DateTime reservedUntil;

  CreateReservationDto({
    required this.itemId,
    required DateTime reservedFrom,
    required DateTime reservedUntil,
  }) : reservedFrom = reservedFrom.toUtc(),
       reservedUntil = reservedUntil.toUtc();

  Map<String, Object?> toJson() {
    return {
      _itemIdKey: itemId,
      _reservedFromKey: reservedFrom.toIso8601String(),
      _reservedUntilKey: reservedUntil.toIso8601String(),
    };
  }
}
