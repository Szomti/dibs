import 'package:dibs/features/items/data/dto/item_dto.dart';
import 'package:dibs/features/items/data/mappers/item_category_mapper.dart';
import 'package:dibs/features/items/data/mappers/item_location_mapper.dart';
import 'package:dibs/features/items/domain/entities/item.dart';

extension ItemDtoMapper on ItemDto {
  Item toEntity() {
    return Item(
      id: id,
      name: name,
      description: description,
      qrCode: qrCode,
      imageUrl: imageUrl,
      category: category.toEntity(),
      location: location.toEntity(),
      isAvailable: isAvailable,
    );
  }
}
