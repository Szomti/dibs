import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../reservations/presentation/providers/upcoming_item_reservations_for_date_provider.dart';
import '../../items.dart';
import '../providers/items_repository_provider.dart';

class ItemPage extends ConsumerWidget {
  static const _pagePadding = EdgeInsets.all(dims.sizeMd);

  final int itemId;

  const ItemPage({required this.itemId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Make nullable for future deeplink + make family provider
    final item = ref.watch(itemsRepositoryProvider).getByIdOrThrow(itemId);
    final upcomingItemReservations = ref.watch(
      upcomingItemReservationsForDateProvider(item),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Symbols.calendar_add_on),
      ),
      body: SafeArea(
        child: Padding(
          padding: _pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ItemReservationDescription(item.description),
              const ItemReservationDateSelection(),
              Expanded(
                child: upcomingItemReservations.when(
                  data: (reservations) => ItemReservationList(reservations),
                  error: (error, stackTrace) => ItemReservationListError(item),
                  loading: () => const ItemReservationListSkeleton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
