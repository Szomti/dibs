import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../items/items.dart';
import '../../reservation.dart';

class ItemReservationPage extends ConsumerStatefulWidget {
  final int itemId;

  const ItemReservationPage({required this.itemId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemReservationPageState();
}

class _ItemReservationPageState extends ConsumerState<ItemReservationPage> {
  @override
  Widget build(BuildContext context) {
    final item = ref
        .watch(itemsRepositoryProvider)
        .getByIdOrThrow(widget.itemId);
    final creation = ref.watch(createReservationProvider);
    ref.listen(createReservationProvider, _onCreation);
    return ProviderScope(
      overrides: [currentItemIdProvider.overrideWithValue(widget.itemId)],
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Reservation',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  const ItemReservationConflictInfo(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Skeletonizer(
                        enabled: switch (creation) {
                          AsyncLoading<void>() => true,
                          AsyncData<void>() => false,
                          AsyncError<void>() => false,
                        },
                        child: const Column(
                          children: [
                            SizedBox(height: dims.sizeMd),
                            ItemReservationTimeRange(),
                            SizedBox(height: dims.sizeMd),
                            ItemReservationStartButtons(),
                            SizedBox(height: dims.sizeMd),
                            ItemReservationDateTimeCard(),
                            SizedBox(height: dims.sizeMd),
                            ItemReservationDurationButtons(),
                            SizedBox(height: dims.sizeMd),
                            ItemReservationDurationSelection(),
                            SizedBox(height: dims.sizeXl),
                            SizedBox(height: dims.sizeXl),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const ItemReservationConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _onCreation(
    AsyncValue<void>? prev,
    AsyncValue<void>? next,
  ) {
    next?.whenOrNull(
      data: (data) {
        ref.invalidate(upcomingItemReservationsProvider(widget.itemId));
        context.go('/app/reservations');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            content: Text(
              'Created reservation',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        );
      },
      error: (err, _) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          content: Text(
            'Error: $err',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
        ),
      ),
    );
  }
}
