import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../dto/upcoming_item_reservations_dto.dart';

final class UpcomingItemReservationsRemoteDatasource extends RemoteDatasource {
  UpcomingItemReservationsRemoteDatasource(super.dio);

  Future<UpcomingItemReservationsDto> getUpcoming(int itemId) async {
    try {
      final response = await dio.get(
        urls.itemUpcomingReservationsPath(itemId),
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return UpcomingItemReservationsDto.fromJson(jsonObject);
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
