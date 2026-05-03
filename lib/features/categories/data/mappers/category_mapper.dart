import '../../domain/entities/category.dart';
import '../dto/category_dto.dart';

extension CategoryDtoMapper on CategoryDto {
  Category toEntity() {
    return Category(
      id: id,
      name: name,
      description: description,
    );
  }
}
