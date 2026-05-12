import 'dart:collection';

import 'package:meta/meta.dart';

import 'upcoming_item_reservation.dart';

@immutable
final class UpcomingItemReservations {
  static const _nextDayDuration = Duration(days: 1);

  final UnmodifiableSetView<UpcomingItemReservation> items;

  UpcomingItemReservations(Iterable<UpcomingItemReservation> items)
    : items = UnmodifiableSetView(SplayTreeSet.of(items));

  UpcomingItemReservations forDate(DateTime dateTime) {
    final nextDay = dateTime.add(_nextDayDuration);
    return UpcomingItemReservations(
      items.where((item) {
        return item.reservedUntil.isAfter(dateTime) &&
            item.reservedAt.isBefore(nextDay);
      }),
    );
  }
}
