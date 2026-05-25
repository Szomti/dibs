import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/user_reservation.dart';
import '../../reservation.dart';

final userReservationsPagingControllerProvider =
    Provider<PagingController<int, UserReservation>>(
      (ref) => PagingController<int, UserReservation>(
        getNextPageKey: (state) =>
            state.lastPageIsEmpty ? null : state.nextIntPageKey,
        fetchPage: (int pageKey) => ref
            .read(reservationRepositoryProvider)
            .getUserReservations(pageKey),
      ),
    );
