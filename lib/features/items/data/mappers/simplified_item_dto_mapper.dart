import '../../domain/entities/simplified_item.dart';
import '../dto/simplified_item_dto.dart';

extension SimplifiedItemDtoMapper on SimplifiedItemDto {
  SimplifiedItem toEntity() {
    return SimplifiedItem(
      id: id,
      name: name,
      qrCode: qrCode,
      imageUrl: imageUrl,
      categoryName: categoryName,
      locationName: locationName,
    );
  }
}
