import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;

class ItemReservationDescription extends StatelessWidget {
  static const _padding = EdgeInsets.all(dims.sizeMd);
  static const _margin = EdgeInsets.only(bottom: dims.sizeMd);

  final String? description;

  const ItemReservationDescription(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    final description = this.description;
    if (description == null) return const SizedBox.shrink();
    return Card.outlined(
      margin: _margin,
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'DESCRIPTION',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: dims.sizeXs),
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
