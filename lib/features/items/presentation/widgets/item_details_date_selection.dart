import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../items.dart';

class ItemDetailsDateSelection extends ConsumerWidget {
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);
  static const _iconPadding = EdgeInsets.all(dims.sizeSm);
  static const _margin = EdgeInsets.only(bottom: dims.sizeMd);
  static const _maxDuration = Duration(days: 7);

  const ItemDetailsDateSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(itemDetailsSelectedDateProvider);
    return Card.outlined(
      margin: _margin,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () async {
          final newDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(_maxDuration),
          );
          if (newDate == null) return;
          ref
              .read(itemDetailsSelectedDateProvider.notifier)
              .selectDate(newDate);
        },
        child: Padding(
          padding: _cardPadding,
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
              const Padding(
                padding: _iconPadding,
                child: Icon(Symbols.edit_square),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
