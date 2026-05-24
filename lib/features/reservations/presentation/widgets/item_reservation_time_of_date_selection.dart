import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../reservation.dart';

class ItemReservationTimeOfDateSelection extends ConsumerStatefulWidget {
  const ItemReservationTimeOfDateSelection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemReservationTimeOfDateSelectionState();
}

class _ItemReservationTimeOfDateSelectionState
    extends ConsumerState<ItemReservationTimeOfDateSelection> {
  static const _widgetHeight = 120.0;
  late final hourController = FixedExtentScrollController(
    initialItem: ref.read(reservationDraftProvider).startDate.hour,
  );
  late final minuteController = FixedExtentScrollController(
    initialItem: ref.read(reservationDraftProvider).startDate.minute ~/ 5,
  );

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _widgetHeight,
      child: Row(
        children: [
          Expanded(
            child: ListWheelScrollView(
              controller: hourController,
              itemExtent: 40,
              overAndUnderCenterOpacity: 0.5,
              useMagnifier: true,
              magnification: 1.25,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (int index) {
                ref.read(reservationDraftProvider.notifier).setHour(index);
              },
              children: List.generate(24, (int index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$index'.padLeft(2, '0'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Text(':', style: Theme.of(context).textTheme.titleLarge),
          Expanded(
            child: ListWheelScrollView(
              controller: minuteController,
              itemExtent: 40,
              overAndUnderCenterOpacity: 0.5,
              useMagnifier: true,
              magnification: 1.25,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (int index) {
                ref
                    .read(reservationDraftProvider.notifier)
                    .setMinute(index * 5);
              },
              children: List.generate(12, (int index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${index * 5}'.padLeft(2, '0'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
