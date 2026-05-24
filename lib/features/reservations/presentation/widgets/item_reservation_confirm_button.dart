import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../data/mappers/reservation_draft_mapper.dart';
import '../../reservation.dart';

class ItemReservationConfirmButton extends ConsumerWidget {
  static const _padding = EdgeInsets.symmetric(
    vertical: dims.sizeSm,
    horizontal: dims.sizeMd,
  );

  const ItemReservationConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conflict = ref.watch(reservationConflictProvider).value;
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: _padding,
          child: FilledButton(
            onPressed: conflict != null
                ? null
                : () => ref
                      .read(createReservationProvider.notifier)
                      .createReservation(
                        ref
                            .read(reservationDraftProvider)
                            .toCreateReservationDto(),
                      ),
            child: const Text('Confirm reservation'),
          ),
        ),
      ],
    );
  }
}
