import '../../../items/domain/entities/item.dart';
import '../entities/upcoming_item_reservations.dart';

abstract class UpcomingItemReservationsRepository {
  Future<UpcomingItemReservations> getUpcoming(Item item);
}
