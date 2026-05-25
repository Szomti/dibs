import '../../../items/data/mappers/simplified_item_dto_mapper.dart';
import '../../domain/entities/user_reservation.dart';
import '../dto/user_reservation_dto.dart';

extension UserReservationDtoMapper on UserReservationDto {
  UserReservation toEntity() {
    return UserReservation(
      id: id,
      status: status,
      simplifiedItem: simplifiedItem.toEntity(),
      reservedAt: reservedAt,
      reservedUntil: reservedUntil,
      returnedAt: returnedAt,
    );
  }
}
