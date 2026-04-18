import 'package:dibs/core/network/remote_datasource.dart';
import 'package:dibs/core/network/urls.dart';
import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/categories/data/dto/categories_dto.dart';
import 'package:dio/dio.dart';

final class CategoriesRemoteDatasource extends RemoteDatasource {
  CategoriesRemoteDatasource(super.dio);

  Future<CategoriesDto> getCategories() async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        categoriesPath,
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return CategoriesDto.fromJson(jsonObject);
    } on DioException catch (e) {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
