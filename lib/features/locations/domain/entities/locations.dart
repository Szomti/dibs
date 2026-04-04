import 'package:flutter/foundation.dart';
import 'location.dart';

@immutable
final class Locations {
  final Set<Location> items;

  Locations(Iterable<Location> items) : items = Set.unmodifiable(items);
}
