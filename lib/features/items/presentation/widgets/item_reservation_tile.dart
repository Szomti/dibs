import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../../reservations/domain/entities/upcoming_item_reservation.dart';

class ItemReservationTile extends StatelessWidget {
  static const _cardMargin = EdgeInsets.only(bottom: dims.sizeMd);
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);
  static const _contentPadding = EdgeInsets.symmetric(horizontal: dims.sizeMd);

  final UpcomingItemReservation reservation;

  const ItemReservationTile(this.reservation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Reserved for: ${reservation.durationInfo}',
      child: Skeleton.leaf(
        child: Card(
          margin: _cardMargin,
          child: Padding(
            padding: _cardPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  reservation.status.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: dims.sizeXs),
                Padding(
                  padding: _contentPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat.Hm().format(
                            reservation.reservedAt.toLocal(),
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Text(
                        ' - ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Expanded(
                        child: Text(
                          DateFormat.Hm().format(
                            reservation.reservedUntil.toLocal(),
                          ),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
