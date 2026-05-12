import '../../domain/entities/upcoming_item_reservations.dart';
import '../dto/upcoming_item_reservations_dto.dart';
import 'upcoming_item_reservation_mapper.dart';

extension UpcomingItemReservationsDtoMapper on UpcomingItemReservationsDto {
  UpcomingItemReservations toEntity() {
    return UpcomingItemReservations([
      for (final item in items) item.toEntity(),
    ]);
  }
}
