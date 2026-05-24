import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dto/create_reservation_dto.dart';
import '../../reservation.dart';

final createReservationProvider =
    AsyncNotifierProvider<CreateReservationNotifier, void>(
      CreateReservationNotifier.new,
    );

class CreateReservationNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> createReservation(CreateReservationDto dto) async {
    state = const AsyncLoading();
    final repository = ref.read(reservationRepositoryProvider);
    state = await AsyncValue.guard(() => repository.createReservation(dto));
  }
}
