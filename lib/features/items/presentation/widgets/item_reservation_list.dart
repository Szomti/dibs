import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../reservations/domain/entities/upcoming_item_reservations.dart';
import '../../items.dart';

class ItemReservationList extends StatelessWidget {
  static const _verticalPadding = EdgeInsets.symmetric(vertical: dims.sizeMd);
  static const _horizontalPadding = EdgeInsets.symmetric(
    horizontal: dims.sizeMd,
  );

  final UpcomingItemReservations reservations;

  const ItemReservationList(this.reservations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: _horizontalPadding,
        child: Column(
          children: [
            Padding(
              padding: _verticalPadding,
              child: Skeleton.keep(
                child: Text(
                  'ALL RESERVATIONS',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: ListView.builder(
                padding: _verticalPadding,
                itemCount: reservations.items.length,
                itemBuilder: (context, index) {
                  return ItemReservationTile(
                    reservations.items.elementAt(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
