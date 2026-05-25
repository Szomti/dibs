import 'dart:collection';

import 'user_reservation.dart';

final class UserReservations {
  final UnmodifiableSetView<UserReservation> items;

  UserReservations(Iterable<UserReservation> items)
    : items = UnmodifiableSetView(SplayTreeSet.of(items));
}
