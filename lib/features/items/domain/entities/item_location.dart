import 'package:flutter/foundation.dart';

@immutable
final class ItemLocation {
  final int id;
  final String name;

  const ItemLocation({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemLocation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}
