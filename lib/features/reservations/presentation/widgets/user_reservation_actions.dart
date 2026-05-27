import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_status.dart';
import '../../domain/entities/user_reservation.dart';
import '../../reservation.dart';

class UserReservationActions extends ConsumerWidget {
  final UserReservation reservation;

  const UserReservationActions(this.reservation, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    if (now.isBefore(reservation.reservedAt) ||
        now.isAfter(reservation.reservedUntil)) {
      return const SizedBox.shrink();
    }
    return switch (reservation.status) {
      ReservationStatus.pending => Padding(
        padding: const EdgeInsets.only(top: dims.sizeSm),
        child: OutlinedButton(
          onPressed: () async {
            await ref
                .read(reservationRepositoryProvider)
                .activateReservation(reservation);
            ref.read(userReservationsPagingControllerProvider).refresh();
          },
          child: const Text('Activate'),
        ),
      ),
      ReservationStatus.active => Padding(
        padding: const EdgeInsets.only(top: dims.sizeSm),
        child: ElevatedButton(
          onPressed: () async {
            await ref
                .read(reservationRepositoryProvider)
                .completeReservation(reservation);
            ref.read(userReservationsPagingControllerProvider).refresh();
          },
          child: const Text('Complete'),
        ),
      ),
      ReservationStatus.completed => const SizedBox.shrink(),
      ReservationStatus.cancelled => const SizedBox.shrink(),
      ReservationStatus.expired => const SizedBox.shrink(),
    };
  }
}
