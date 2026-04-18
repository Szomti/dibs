import 'package:dibs/features/categories/domain/entities/category.dart';
import 'package:flutter/foundation.dart' hide Category;

@immutable
final class Categories {
  final List<Category> items;

  Categories(Iterable<Category> items)
    : items = List.unmodifiable(Set.of(items));
}
