import '../../domain/entities/upcoming_item_reservation.dart';
import '../dto/upcoming_item_reservation_dto.dart';

extension UpcomingItemReservationDtoMapper on UpcomingItemReservationDto {
  UpcomingItemReservation toEntity() {
    return UpcomingItemReservation(
      id: id,
      status: status,
      reservedAt: reservedAt,
      reservedUntil: reservedUntil,
    );
  }
}
