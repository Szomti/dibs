import '../../domain/entities/upcoming_item_reservations.dart';
import '../../domain/repositories/upcoming_item_reservations_repository.dart';
import '../datasource/upcoming_item_reservations_remote_datasource.dart';
import '../mappers/upcoming_item_reservations_mapper.dart';

final class UpcomingItemReservationsRepositoryImpl
    extends UpcomingItemReservationsRepository {
  final UpcomingItemReservationsRemoteDatasource remoteDatasource;

  UpcomingItemReservationsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<UpcomingItemReservations> getUpcoming(int itemId) async {
    final dto = await remoteDatasource.getUpcoming(itemId);
    return dto.toEntity();
  }
}
