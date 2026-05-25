import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/user_reservation.dart';

class UserReservationTile extends StatelessWidget {
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);
  static final _cardMargin = const EdgeInsets.symmetric(
    horizontal: dims.sizeMd,
  ).copyWith(bottom: dims.sizeMd);

  final UserReservation reservation;

  const UserReservationTile(this.reservation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: _cardMargin,
      child: Padding(
        padding: _cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              reservation.simplifiedItem.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              reservation.simplifiedItem.locationName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: dims.sizeMd),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Start', textAlign: TextAlign.center),
                      Text(
                        DateFormat.MMMd().format(
                          reservation.reservedAt.toLocal(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        DateFormat.Hm().format(
                          reservation.reservedAt.toLocal(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Icon(Symbols.arrow_forward),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('End', textAlign: TextAlign.center),
                      Text(
                        DateFormat.MMMd().format(
                          reservation.reservedUntil.toLocal(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        DateFormat.Hm().format(
                          reservation.reservedUntil.toLocal(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
