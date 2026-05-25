import '../../domain/entities/user_reservations.dart';
import '../dto/user_reservations_dto.dart';
import 'user_reservation_dto_mapper.dart';

extension UserReservationsDtoMapper on UserReservationsDto {
  UserReservations toEntity() {
    return UserReservations(items.map((item) => item.toEntity()));
  }
}
