import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../dto/categories_dto.dart';

final class CategoriesRemoteDatasource extends RemoteDatasource {
  CategoriesRemoteDatasource(super.dio);

  Future<CategoriesDto> getCategories() async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        urls.categoriesPath,
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return CategoriesDto.fromJson(jsonObject);
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
