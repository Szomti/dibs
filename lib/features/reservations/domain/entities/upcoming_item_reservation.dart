import 'package:meta/meta.dart';

import '../../../../core/extensions/duration_extension.dart';
import 'reservation_status.dart';
import 'reservation_time_range.dart';

@immutable
final class UpcomingItemReservation
    implements Comparable<UpcomingItemReservation> {
  final int id;
  final ReservationStatus status;
  final DateTime reservedAt;
  final DateTime reservedUntil;

  String get durationInfo =>
      reservedUntil.difference(reservedAt).toShortString();

  ReservationTimeRange get timeRange =>
      ReservationTimeRange(start: reservedAt, end: reservedUntil);

  const UpcomingItemReservation({
    required this.id,
    required this.status,
    required this.reservedAt,
    required this.reservedUntil,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpcomingItemReservation &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  int compareTo(UpcomingItemReservation other) {
    final dateResult = reservedAt.compareTo(other.reservedAt);
    if (dateResult != 0) return dateResult;
    return id.compareTo(other.id);
  }
}
