import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../dto/items_dto.dart';

final class ItemsRemoteDatasource extends RemoteDatasource {
  static const _perPageKey = 'per_page';
  static const _perPageValue = 10;
  static const _pageKey = 'page';

  ItemsRemoteDatasource(super.dio);

  Future<ItemsDto> getItems({
    required int categoryId,
    required int locationId,
    required int page,
  }) async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        urls.itemsPath(categoryId, locationId),
        options: jsonOptions,
        queryParameters: {_perPageKey: _perPageValue, _pageKey: page},
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return ItemsDto.fromJson(jsonObject);
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
