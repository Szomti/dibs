import '../../domain/repositories/reservation_repository.dart';
import '../datasource/reservation_remote_datasource.dart';
import '../dto/create_reservation_dto.dart';

class ReservationRepositoryImpl extends ReservationRepository {
  final ReservationRemoteDatasource remoteDatasource;

  ReservationRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> createReservation(CreateReservationDto dto) async {
    await remoteDatasource.createReservation(dto);
  }
}
