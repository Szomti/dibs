import 'package:dibs/features/items/domain/entities/item.dart';
import 'package:flutter/foundation.dart';

@immutable
final class Items {
  final Set<Item> values;

  Items(Iterable<Item> values) : values = Set.unmodifiable(values);
}
