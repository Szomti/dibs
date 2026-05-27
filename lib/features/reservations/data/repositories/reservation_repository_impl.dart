import '../../domain/entities/user_reservation.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../datasource/reservation_remote_datasource.dart';
import '../dto/create_reservation_dto.dart';
import '../mappers/user_reservations_dto_mapper.dart';

class ReservationRepositoryImpl extends ReservationRepository {
  final ReservationRemoteDatasource remoteDatasource;

  ReservationRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> createReservation(CreateReservationDto dto) async {
    await remoteDatasource.createReservation(dto);
  }

  @override
  Future<List<UserReservation>> getUserReservations(int page) async {
    final dto = await remoteDatasource.getUserReservations(page);
    return dto.toEntity().items.toList();
  }

  @override
  Future<void> activateReservation(UserReservation reservation) async {
    await remoteDatasource.activateReservation(reservation.id);
  }

  @override
  Future<void> completeReservation(UserReservation reservation) async {
    await remoteDatasource.completeReservation(reservation.id);
  }
}
