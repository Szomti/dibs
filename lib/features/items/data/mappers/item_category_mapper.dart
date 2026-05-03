import '../../domain/entities/item_category.dart';
import '../dto/item_category_dto.dart';

extension ItemCategoryDtoMapper on ItemCategoryDto {
  ItemCategory toEntity() {
    return ItemCategory(id: id, name: name);
  }
}
