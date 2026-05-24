import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/upcoming_item_reservations.dart';
import 'upcoming_item_reservations_repository_provider.dart';

final upcomingItemReservationsProvider = FutureProvider.autoDispose
    .family<UpcomingItemReservations, int>(
      (ref, itemId) async => ref
          .watch(upcomingItemReservationsRepositoryProvider)
          .getUpcoming(itemId),
    );
