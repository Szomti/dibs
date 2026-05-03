import 'package:flutter/foundation.dart';

@immutable
final class ItemLocationDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';

  final int id;
  final String name;

  const ItemLocationDto({required this.id, required this.name});

  factory ItemLocationDto.fromJson(Map<String, Object?> jsonObject) {
    return ItemLocationDto(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
    );
  }
}
