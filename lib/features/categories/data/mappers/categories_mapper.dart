import '../../domain/entities/categories.dart';
import '../dto/categories_dto.dart';
import 'category_mapper.dart';

extension CategoriesDtoMapper on CategoriesDto {
  Categories toEntity() {
    return Categories(items.map((item) => item.toEntity()));
  }
}
