import '../entities/upcoming_item_reservations.dart';

abstract class UpcomingItemReservationsRepository {
  Future<UpcomingItemReservations> getUpcoming(int itemId);
}
