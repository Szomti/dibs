import 'package:dibs/features/categories/data/dto/categories_dto.dart';
import 'package:dibs/features/categories/data/mappers/category_mapper.dart';
import 'package:dibs/features/categories/domain/entities/categories.dart';

extension CategoriesDtoMapper on CategoriesDto {
  Categories toEntity() {
    return Categories([for (final item in items) item.toEntity()]);
  }
}
