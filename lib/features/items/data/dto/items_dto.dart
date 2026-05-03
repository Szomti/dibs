import 'package:dibs/features/items/data/dto/item_dto.dart';

final class ItemsDto {
  static const _dataKey = 'data';

  final List<ItemDto> values;

  ItemsDto._(Iterable<ItemDto> values) : values = List.unmodifiable(values);

  factory ItemsDto.fromJson(Map<String, Object?> jsonObject) {
    final jsonArray = jsonObject[_dataKey] as Iterable;
    return ItemsDto._([
      for (final json in jsonArray.whereType<Map<String, Object?>>())
        ItemDto.fromJson(json),
    ]);
  }
}
