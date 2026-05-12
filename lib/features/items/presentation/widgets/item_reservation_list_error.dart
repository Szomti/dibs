import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../reservations/presentation/providers/upcoming_item_reservations_provider.dart';
import '../../domain/entities/item.dart';

class ItemReservationListError extends ConsumerWidget {
  static const _verticalPadding = EdgeInsets.symmetric(vertical: dims.sizeMd);
  static const _horizontalPadding = EdgeInsets.symmetric(
    horizontal: dims.sizeMd,
  );

  final Item item;

  const ItemReservationListError(this.item, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
      child: Padding(
        padding: _horizontalPadding,
        child: Column(
          children: [
            Padding(
              padding: _verticalPadding,
              child: Text(
                'ALL RESERVATIONS',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error occurred',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () => ref.invalidate(
                      upcomingItemReservationsProvider(item),
                      asReload: true,
                    ),
                    icon: const Icon(Symbols.refresh, size: dims.sizeXl),
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
