import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/user_reservation.dart';
import '../../reservation.dart';
import '../widgets/user_reservation_tile.dart';

class UserReservationsPage extends ConsumerWidget {
  static const _listViewPadding = EdgeInsets.symmetric(vertical: dims.sizeMd);

  const UserReservationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = ref.watch(
      userReservationsPagingControllerProvider,
    );
    return PagingListener(
      controller: pagingController,
      builder: (context, state, fetchNextPage) {
        return PagedListView<int, UserReservation>(
          state: state,
          fetchNextPage: fetchNextPage,
          padding: _listViewPadding,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, reservation, index) {
              return UserReservationTile(reservation);
            },
          ),
        );
      },
    );
  }
}
