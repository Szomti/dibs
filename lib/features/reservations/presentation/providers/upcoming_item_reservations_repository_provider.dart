import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/upcoming_item_reservations_remote_datasource.dart';
import '../../data/repositories/upcoming_item_reservations_repository_impl.dart';
import '../../domain/repositories/upcoming_item_reservations_repository.dart';

final upcomingItemReservationsRepositoryProvider =
    Provider<UpcomingItemReservationsRepository>(
      (ref) => UpcomingItemReservationsRepositoryImpl(
        remoteDatasource: UpcomingItemReservationsRemoteDatasource(
          ref.watch(dioProvider),
        ),
      ),
    );
