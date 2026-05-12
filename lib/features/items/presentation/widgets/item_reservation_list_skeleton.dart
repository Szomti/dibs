import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../reservations/domain/entities/reservation_status.dart';
import '../../../reservations/domain/entities/upcoming_item_reservation.dart';
import '../../../reservations/domain/entities/upcoming_item_reservations.dart';
import '../../items.dart';

class ItemReservationListSkeleton extends StatelessWidget {
  static final _now = DateTime.now();

  const ItemReservationListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ItemReservationList(
        UpcomingItemReservations([
          UpcomingItemReservation(
            id: 1,
            status: ReservationStatus.active,
            reservedAt: _now,
            reservedUntil: _now,
          ),
          UpcomingItemReservation(
            id: 2,
            status: ReservationStatus.pending,
            reservedAt: _now,
            reservedUntil: _now,
          ),
          UpcomingItemReservation(
            id: 3,
            status: ReservationStatus.pending,
            reservedAt: _now,
            reservedUntil: _now,
          ),
          UpcomingItemReservation(
            id: 4,
            status: ReservationStatus.pending,
            reservedAt: _now,
            reservedUntil: _now,
          ),
        ]),
      ),
    );
  }
}
