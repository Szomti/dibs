import 'package:dibs/features/items/domain/entities/item.dart';

import '../../data/datasource/items_remote_datasource.dart';

abstract class ItemsRepository {
  final ItemsRemoteDatasource remoteDatasource;

  ItemsRepository(this.remoteDatasource);

  Future<List<Item>> getItems({
    required int categoryId,
    required int locationId,
    required int page,
  });
}
