import '../entities/item.dart';

abstract class ItemsRepository {
  Future<List<Item>> getItems({
    required int categoryId,
    required int locationId,
    required int page,
  });

  Item? getByIdOrNull(int id);
  Item getByIdOrThrow(int id);
}
