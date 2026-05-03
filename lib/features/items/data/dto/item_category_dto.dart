import 'package:flutter/foundation.dart';

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
}
