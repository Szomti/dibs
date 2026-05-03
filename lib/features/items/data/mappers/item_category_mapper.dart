import 'package:dibs/features/items/data/dto/item_category_dto.dart';
import 'package:dibs/features/items/domain/entities/item_category.dart';

extension ItemCategoryDtoMapper on ItemCategoryDto {
  ItemCategory toEntity() {
    return ItemCategory(id: id, name: name);
  }
}
