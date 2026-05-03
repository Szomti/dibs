import '../entities/item.dart';

abstract class ItemsRepository {
  Future<List<Item>> getItems({
    required int categoryId,
    required int locationId,
    required int page,
  });
}
