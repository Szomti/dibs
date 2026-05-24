import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/reservation_remote_datasource.dart';
import '../../data/repositories/reservation_repository_impl.dart';
import '../../domain/repositories/reservation_repository.dart';

final reservationRepositoryProvider = Provider<ReservationRepository>(
  (ref) => ReservationRepositoryImpl(
    ReservationRemoteDatasource(ref.watch(dioProvider)),
  ),
);
