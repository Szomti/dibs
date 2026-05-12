import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../domain/entities/item.dart';

class ItemTile extends StatelessWidget {
  static const _cardMargin = EdgeInsets.symmetric(
    horizontal: dims.sizeMd,
    vertical: dims.sizeSm,
  );
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);

  final int categoryId;
  final int locationId;
  final Item item;

  const ItemTile({
    required this.categoryId,
    required this.locationId,
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _cardMargin,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(
          '/app/categories/$categoryId/locations/$locationId/items/${item.id}',
        ),
        child: Padding(
          padding: _cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                item.description ?? 'No description',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
