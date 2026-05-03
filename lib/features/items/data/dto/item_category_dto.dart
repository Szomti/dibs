import 'package:meta/meta.dart';

@immutable
final class ItemCategoryDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';

  final int id;
  final String name;

  const ItemCategoryDto({required this.id, required this.name});

  factory ItemCategoryDto.fromJson(Map<String, Object?> jsonObject) {
    return ItemCategoryDto(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCategoryDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
