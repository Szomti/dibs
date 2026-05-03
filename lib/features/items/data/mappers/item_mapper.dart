import '../../domain/entities/item.dart';
import '../dto/item_dto.dart';
import 'item_category_mapper.dart';
import 'item_location_mapper.dart';

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
