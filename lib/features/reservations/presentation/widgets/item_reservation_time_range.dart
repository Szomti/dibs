import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../providers/reservation_draft_provider.dart';

class ItemReservationTimeRange extends ConsumerWidget {
  static const _cardMargin = EdgeInsets.symmetric(horizontal: dims.sizeMd);
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);

  const ItemReservationTimeRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = ref.watch(
      reservationDraftProvider.select((draft) => draft.startDate),
    );
    final endDate = ref.watch(
      reservationDraftProvider.select((draft) => draft.endDate),
    );
    return Card.outlined(
      margin: _cardMargin,
      child: Padding(
        padding: _cardPadding,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Start', textAlign: TextAlign.center),
                  Text(
                    DateFormat.MMMd().format(startDate),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    DateFormat.Hm().format(startDate),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Icon(Symbols.arrow_forward),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('End', textAlign: TextAlign.center),
                  Text(
                    DateFormat.MMMd().format(endDate),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    DateFormat.Hm().format(endDate),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
