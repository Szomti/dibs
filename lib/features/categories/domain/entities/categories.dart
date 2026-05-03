import 'package:meta/meta.dart';

import 'category.dart';

@immutable
final class Categories {
  final List<Category> items;

  Categories(Iterable<Category> items)
    : items = List.unmodifiable(Set.of(items));
}
