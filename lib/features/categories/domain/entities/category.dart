import 'package:meta/meta.dart';

@immutable
final class Category {
  final int id;
  final String name;
  final String? description;

  const Category({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
