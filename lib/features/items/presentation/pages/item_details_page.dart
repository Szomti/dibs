import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../../core/extensions/uri_extension.dart';
import '../../../reservations/reservation.dart';
import '../../items.dart';

class ItemDetailsPage extends ConsumerWidget {
  static const _pagePadding = EdgeInsets.all(dims.sizeMd);

  final Uri route;
  final int itemId;

  const ItemDetailsPage({required this.route, required this.itemId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Make nullable for future deeplink + make family provider
    final item = ref.watch(itemsRepositoryProvider).getByIdOrThrow(itemId);
    final upcomingItemReservations = ref.watch(
      upcomingItemReservationsForDateProvider(itemId),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(route.withSegments(['reservation']).toString());
        },
        child: const Icon(Symbols.calendar_add_on),
      ),
      body: SafeArea(
        child: Padding(
          padding: _pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ItemDetailsDescription(item.description),
              const ItemDetailsDateSelection(),
              Expanded(
                child: upcomingItemReservations.when(
                  data: (reservations) =>
                      ItemDetailsReservationList(reservations),
                  error: (error, stackTrace) =>
                      ItemDetailsReservationListError(item),
                  loading: () => const ItemDetailsReservationListSkeleton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
