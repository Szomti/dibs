import 'package:meta/meta.dart';

import 'item.dart';

@immutable
final class Items {
  final Set<Item> values;

  Items(Iterable<Item> values) : values = Set.unmodifiable(values);
}
