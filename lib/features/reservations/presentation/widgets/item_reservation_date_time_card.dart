import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_draft.dart';
import '../../reservation.dart';

class ItemReservationDateTimeCard extends ConsumerWidget {
  static const _cardMargin = EdgeInsets.symmetric(horizontal: dims.sizeMd);
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);
  static const _animationDuration = Duration(milliseconds: 300);

  const ItemReservationDateTimeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputOption = ref.watch(
      reservationDraftProvider.select((draft) => draft.inputOption),
    );
    final startDate = ref.watch(
      reservationDraftProvider.select((draft) => draft.startDate),
    );
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute + (5 - (now.minute % 5)),
    );
    final lastDate = firstDate.add(const Duration(days: 7));
    return Card.outlined(
      margin: _cardMargin,
      child: Padding(
        padding: _cardPadding,
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: _animationDuration,
              child: switch (inputOption) {
                DateTimeInputOption.date => CalendarDatePicker(
                  initialDate: startDate,
                  firstDate: firstDate,
                  lastDate: lastDate,
                  onDateChanged: (date) =>
                      ref.read(reservationDraftProvider.notifier).setDate(date),
                ),
                DateTimeInputOption.time =>
                  const ItemReservationTimeOfDateSelection(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
