import 'package:dibs/features/categories/data/dto/category_dto.dart';

final class CategoriesDto {
  static const _dataKey = 'data';

  final List<CategoryDto> items;

  CategoriesDto._(Iterable<CategoryDto> items)
    : items = List.unmodifiable(items);

  factory CategoriesDto.fromJson(Map<String, Object?> jsonObject) {
    final categories = <CategoryDto>[];
    final array = jsonObject[_dataKey] as Iterable;
    for (final jsonObject in array.whereType<Map<String, Object?>>()) {
      categories.add(CategoryDto.fromJson(jsonObject));
    }
    return CategoriesDto._(categories);
  }
}
