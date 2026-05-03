import '../../domain/entities/item_location.dart';
import '../dto/item_location_dto.dart';

extension ItemLocationDtoMapper on ItemLocationDto {
  ItemLocation toEntity() {
    return ItemLocation(id: id, name: name);
  }
}
