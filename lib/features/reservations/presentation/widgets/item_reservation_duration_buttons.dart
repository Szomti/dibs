import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_draft.dart';
import '../../reservation.dart';

class ItemReservationDurationButtons extends ConsumerWidget {
  static const _margin = EdgeInsets.symmetric(horizontal: dims.sizeMd);

  const ItemReservationDurationButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(reservationDraftProvider);
    return Padding(
      padding: _margin,
      child: Row(
        children: [
          Expanded(
            child: SegmentedButton<DurationOption>(
              segments: const [
                ButtonSegment<DurationOption>(
                  value: DurationOption.minutes,
                  label: Text('Minutes'),
                ),
                ButtonSegment<DurationOption>(
                  value: DurationOption.hours,
                  label: Text('Hours'),
                ),
              ],
              selected: {draft.durationOption},
              onSelectionChanged: (Set<DurationOption> newValues) {
                ref
                    .read(reservationDraftProvider.notifier)
                    .setDurationOption(newValues.first);
              },
            ),
          ),
        ],
      ),
    );
  }
}
