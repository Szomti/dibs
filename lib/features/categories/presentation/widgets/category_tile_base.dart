import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;

class CategoryTileBase extends StatelessWidget {
  final int? id;
  final String name;
  final String? description;

  const CategoryTileBase({
    required this.id,
    required this.name,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: description == null
          ? _createContent(context)
          : _createContentWithTooltip(context),
    );
  }

  Widget _createContentWithTooltip(BuildContext context) {
    return Tooltip(
      margin: const EdgeInsets.symmetric(horizontal: dims.sizeMd),
      message: description,
      child: _createContent(context),
    );
  }

  Widget _createContent(BuildContext context) {
    return InkWell(
      onTap: id != null ? () => context.go('/app/categories/$id') : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: dims.sizeMd,
          vertical: dims.sizeSm,
        ),
        child: Row(
          children: [
            Expanded(child: Row(children: [Text(name)])),
            IconButton(
              icon: const Icon(Symbols.arrow_forward_ios),
              onPressed: id != null
                  ? () => context.go('/app/categories/$id')
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
