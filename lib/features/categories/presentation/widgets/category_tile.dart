import 'package:flutter/material.dart';

import '../../categories.dart';
import '../../domain/entities/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryTileBase(
      id: category.id,
      name: category.name,
      description: category.description,
    );
  }
}
