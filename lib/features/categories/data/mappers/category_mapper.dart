import 'package:dibs/features/categories/data/dto/category_dto.dart';
import 'package:dibs/features/categories/domain/entities/category.dart';

extension CategoryDtoMapper on CategoryDto {
  Category toEntity() {
    return Category(
      id: id,
      name: name,
      description: description,
    );
  }
}
