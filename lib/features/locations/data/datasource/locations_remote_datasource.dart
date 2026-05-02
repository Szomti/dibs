import 'package:dibs/core/network/remote_datasource.dart';
import 'package:dibs/core/network/urls.dart' as urls;
import 'package:dibs/features/locations/data/dto/locations_dto.dart';
import 'package:dio/dio.dart';

class LocationsRemoteDatasource extends RemoteDatasource {
  static const _perPageKey = 'per_page';
  static const _perPageValue = 10;
  static const _pageKey = 'page';

  LocationsRemoteDatasource(super.dio);

  Future<LocationsDto> getLocations(int categoryId, int page) async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        urls.locationsPath(categoryId),
        options: jsonOptions,
        queryParameters: {_pageKey: page, _perPageKey: _perPageValue},
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return LocationsDto.fromJson(jsonObject);
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
