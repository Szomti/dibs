import '../../data/dto/create_reservation_dto.dart';

abstract class ReservationRepository {
  Future<void> createReservation(CreateReservationDto dto);
}
