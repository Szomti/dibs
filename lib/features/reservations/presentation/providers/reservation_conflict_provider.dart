import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../items/items.dart';
import '../../domain/entities/reservation_time_range.dart';
import 'reservation_draft_provider.dart';
import 'upcoming_item_reservations_provider.dart';

final reservationConflictProvider =
    Provider.autoDispose<AsyncValue<ReservationTimeRange?>>((ref) {
      final itemId = ref.watch(currentItemIdProvider);
      final draftTimeRange = ref.watch(
        reservationDraftProvider.select((draft) => draft.timeRange),
      );
      final reservations = ref.watch(upcomingItemReservationsProvider(itemId));
      return reservations.whenData((data) {
        for (final item in data.items) {
          final itemTimeRange = item.timeRange;
          if (!draftTimeRange.overlaps(itemTimeRange)) continue;
          return itemTimeRange;
        }
        return null;
      });
    }, dependencies: [currentItemIdProvider, reservationDraftProvider]);
