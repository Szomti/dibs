import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/reservation_draft.dart';
import '../../reservation.dart';

class ItemReservationDurationSelection extends ConsumerStatefulWidget {
  const ItemReservationDurationSelection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemReservationDurationSelectionState();
}

class _ItemReservationDurationSelectionState
    extends ConsumerState<ItemReservationDurationSelection> {
  late final durationController = FixedExtentScrollController(
    initialItem: ref.read(reservationDraftProvider).durationValue,
  );

  @override
  void dispose() {
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final durationOption = ref.watch(
      reservationDraftProvider.select((draft) => draft.durationOption),
    );
    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: dims.sizeMd),
      child: Padding(
        padding: const EdgeInsets.all(dims.sizeMd),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(child: Text('Duration', textAlign: TextAlign.center)),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListWheelScrollView(
                controller: durationController,
                itemExtent: 40,
                overAndUnderCenterOpacity: 0.5,
                useMagnifier: true,
                magnification: 1.25,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (int index) => ref
                    .read(reservationDraftProvider.notifier)
                    .setDurationValue(index + 1),
                children: List.generate(
                  switch (durationOption) {
                    DurationOption.hours => 4,
                    DurationOption.minutes => (4 * 60 / 5).floor(),
                  },
                  (int index) {
                    return Text(switch (durationOption) {
                      DurationOption.hours => '${index + 1}',
                      DurationOption.minutes => '${(index + 1) * 5}',
                    }, style: Theme.of(context).textTheme.titleLarge);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
