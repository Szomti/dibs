import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_draft.dart';
import '../providers/reservation_draft_provider.dart';

class ItemReservationStartButtons extends ConsumerWidget {
  const ItemReservationStartButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputOption = ref.watch(
      reservationDraftProvider.select((draft) => draft.inputOption),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dims.sizeMd),
      child: Row(
        children: [
          Expanded(
            child: SegmentedButton<DateTimeInputOption>(
              segments: const [
                ButtonSegment<DateTimeInputOption>(
                  value: DateTimeInputOption.date,
                  label: Text('Date'),
                ),
                ButtonSegment<DateTimeInputOption>(
                  value: DateTimeInputOption.time,
                  label: Text('Time'),
                ),
              ],
              selected: {inputOption},
              onSelectionChanged: (Set<DateTimeInputOption> newValues) {
                ref
                    .read(reservationDraftProvider.notifier)
                    .setInputOption(newValues.first);
              },
            ),
          ),
        ],
      ),
    );
  }
}
