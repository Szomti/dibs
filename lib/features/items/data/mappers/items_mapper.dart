import 'package:dibs/features/items/data/dto/items_dto.dart';
import 'package:dibs/features/items/data/mappers/item_mapper.dart';
import 'package:dibs/features/items/domain/entities/items.dart';

extension ItemsDtoMapper on ItemsDto {
  Items toEntity() {
    return Items([for (final value in values) value.toEntity()]);
  }
}
