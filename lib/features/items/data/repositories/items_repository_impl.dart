import '../../domain/entities/item.dart';
import '../../domain/repositories/items_repository.dart';
import '../datasource/items_remote_datasource.dart';
import '../mappers/items_mapper.dart';

final class ItemsRepositoryImpl extends ItemsRepository {
  final ItemsRemoteDatasource remoteDatasource;

  ItemsRepositoryImpl(this.remoteDatasource);

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
