import 'package:dibs/features/items/data/dto/item_location_dto.dart';
import 'package:dibs/features/items/domain/entities/item_location.dart';

extension ItemLocationDtoMapper on ItemLocationDto {
  ItemLocation toEntity() {
    return ItemLocation(id: id, name: name);
  }
}
