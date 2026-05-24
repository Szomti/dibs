import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../items/presentation/providers/item_selected_date_provider.dart';
import '../../domain/entities/upcoming_item_reservations.dart';
import 'upcoming_item_reservations_provider.dart';

final upcomingItemReservationsForDateProvider = Provider.autoDispose
    .family<AsyncValue<UpcomingItemReservations>, int>((ref, itemId) {
      final selectedDate = ref.watch(itemDetailsSelectedDateProvider);
      final reservations = ref.watch(upcomingItemReservationsProvider(itemId));
      return reservations.whenData((data) => data.forDate(selectedDate));
    });
