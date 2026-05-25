import 'package:meta/meta.dart';

import '../../../items/domain/entities/simplified_item.dart';
import 'reservation_status.dart';

@immutable
final class UserReservation implements Comparable<UserReservation> {
  final int id;
  final ReservationStatus status;
  final SimplifiedItem simplifiedItem;
  final DateTime reservedAt;
  final DateTime reservedUntil;
  final DateTime? returnedAt;

  const UserReservation({
    required this.id,
    required this.status,
    required this.simplifiedItem,
    required this.reservedAt,
    required this.reservedUntil,
    required this.returnedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserReservation &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  int compareTo(UserReservation other) {
    final dateResult = other.reservedAt.compareTo(reservedAt);
    if (dateResult != 0) return dateResult;
    return other.id.compareTo(id);
  }
}
