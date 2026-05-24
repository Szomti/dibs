import '../../domain/entities/reservation_draft.dart';
import '../dto/create_reservation_dto.dart';

extension ReservationDraftMapper on ReservationDraft {
  CreateReservationDto toCreateReservationDto() {
    return CreateReservationDto(
      itemId: itemId,
      reservedFrom: startDate,
      reservedUntil: endDate,
    );
  }
}
