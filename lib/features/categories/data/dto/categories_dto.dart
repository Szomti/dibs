import 'package:meta/meta.dart';

import 'category_dto.dart';

@immutable
final class CategoriesDto {
  static const _dataKey = 'data';

  final List<CategoryDto> items;

  CategoriesDto._(Iterable<CategoryDto> items)
    : items = List.unmodifiable(items);

  factory CategoriesDto.fromJson(Map<String, Object?> jsonObject) {
    final categories = <CategoryDto>[];
    final array = jsonObject[_dataKey] as Iterable<Object?>;
    for (final jsonObject in array.whereType<Map<String, Object?>>()) {
      categories.add(CategoryDto.fromJson(jsonObject));
    }
    return CategoriesDto._(categories);
  }
}
