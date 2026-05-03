import 'package:meta/meta.dart';

@immutable
final class ItemCategory {
  final int id;
  final String name;

  const ItemCategory({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCategory &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
