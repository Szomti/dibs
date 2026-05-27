import '../../data/dto/create_reservation_dto.dart';
import '../entities/user_reservation.dart';

abstract class ReservationRepository {
  Future<void> createReservation(CreateReservationDto dto);

  Future<List<UserReservation>> getUserReservations(int page);

  Future<void> completeReservation(UserReservation reservation);

  Future<void> activateReservation(UserReservation reservation);
}
