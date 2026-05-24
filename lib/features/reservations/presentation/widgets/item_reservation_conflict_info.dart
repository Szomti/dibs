import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_time_range.dart';
import '../../reservation.dart';

class ItemReservationConflictInfo extends ConsumerWidget {
  static const _animationDuration = Duration(milliseconds: 300);
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);

  const ItemReservationConflictInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conflictTimeRange = ref.watch(reservationConflictProvider).value;
    return AnimatedSize(
      duration: _animationDuration,
      child: switch (conflictTimeRange) {
        ReservationTimeRange() => Container(
          padding: _cardPadding,
          color: Theme.of(context).colorScheme.error,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Selected time conflicts with existing reservation',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              Text(
                '${DateFormat.Hm().format(conflictTimeRange.start)} - ${DateFormat.Hm().format(conflictTimeRange.end)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
            ],
          ),
        ),
        null => const SizedBox.shrink(),
      },
    );
  }
}
