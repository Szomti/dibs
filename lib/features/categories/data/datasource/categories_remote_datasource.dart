import 'package:dibs/core/network/remote_datasource.dart';
import 'package:dibs/core/network/urls.dart' as urls;
import 'package:dibs/features/categories/data/dto/categories_dto.dart';
import 'package:dio/dio.dart';

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
