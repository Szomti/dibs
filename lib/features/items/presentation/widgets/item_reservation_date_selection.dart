import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../providers/item_selected_date_provider.dart';

class ItemReservationDateSelection extends ConsumerWidget {
  static const _padding = EdgeInsets.all(dims.sizeMd);
  static const _margin = EdgeInsets.only(bottom: dims.sizeMd);
  static const _maxDuration = Duration(days: 7);

  const ItemReservationDateSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(itemSelectedDateProvider);
    return Card.outlined(
      margin: _margin,
      child: Padding(
        padding: _padding,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selected date:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    DateFormat.MMMMEEEEd().format(selectedDate),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(_maxDuration),
                );
                if (newDate == null) return;
                ref.read(itemSelectedDateProvider.notifier).selectDate(newDate);
              },
              icon: const Icon(Symbols.edit_square),
            ),
          ],
        ),
      ),
    );
  }
}
