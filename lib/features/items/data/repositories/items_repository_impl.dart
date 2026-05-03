import 'package:dibs/features/items/data/mappers/items_mapper.dart';
import 'package:dibs/features/items/domain/entities/item.dart';
import 'package:dibs/features/items/domain/repositories/items_repository.dart';

final class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRepositoryImpl(super.remoteDatasource);

  @override
  Future<List<Item>> getItems({
    required int categoryId,
    required int locationId,
    required int page,
  }) async {
    final dto = await remoteDatasource.getItems(
      categoryId: categoryId,
      locationId: locationId,
      page: page,
    );
    return dto.toEntity().values.toList();
  }
}
