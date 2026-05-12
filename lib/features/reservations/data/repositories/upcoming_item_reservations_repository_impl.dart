import '../../../items/domain/entities/item.dart';
import '../../domain/entities/reservation_status.dart';
import '../../domain/entities/upcoming_item_reservation.dart';
import '../../domain/entities/upcoming_item_reservations.dart';
import '../../domain/repositories/upcoming_item_reservations_repository.dart';
import '../datasource/upcoming_item_reservations_remote_datasource.dart';
import '../mappers/upcoming_item_reservations_mapper.dart';

final class UpcomingItemReservationsRepositoryImpl
    extends UpcomingItemReservationsRepository {
  final UpcomingItemReservationsRemoteDatasource remoteDatasource;

  // TODO: Delete later
  final List<UpcomingItemReservation> mockedItems = [
    UpcomingItemReservation(
      id: 1,
      status: ReservationStatus.active,
      reservedAt: DateTime.now().add(const Duration(minutes: -10)),
      reservedUntil: DateTime.now().add(const Duration(minutes: 50)),
    ),
    UpcomingItemReservation(
      id: 2,
      status: ReservationStatus.pending,
      reservedAt: DateTime.now().add(const Duration(minutes: 50)),
      reservedUntil: DateTime.now().add(const Duration(minutes: 140)),
    ),
    UpcomingItemReservation(
      id: 3,
      status: ReservationStatus.pending,
      reservedAt: DateTime.now().add(const Duration(minutes: 200)),
      reservedUntil: DateTime.now().add(const Duration(minutes: 360)),
    ),
    UpcomingItemReservation(
      id: 4,
      status: ReservationStatus.pending,
      reservedAt: DateTime.now().add(const Duration(minutes: 620)),
      reservedUntil: DateTime.now().add(const Duration(minutes: 680)),
    ),
  ];

  UpcomingItemReservationsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<UpcomingItemReservations> getUpcoming(Item item) async {
    final dto = await remoteDatasource.getUpcoming(item);

    // TODO: Delete later
    return UpcomingItemReservations(mockedItems);

    return dto.toEntity();
  }
}
