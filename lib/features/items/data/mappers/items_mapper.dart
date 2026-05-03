import '../../domain/entities/items.dart';
import '../dto/items_dto.dart';
import 'item_mapper.dart';

extension ItemsDtoMapper on ItemsDto {
  Items toEntity() {
    return Items([for (final value in values) value.toEntity()]);
  }
}
