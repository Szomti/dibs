import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../../../items/domain/entities/item.dart';
import '../dto/upcoming_item_reservations_dto.dart';

final class UpcomingItemReservationsRemoteDatasource extends RemoteDatasource {
  UpcomingItemReservationsRemoteDatasource(super.dio);

  Future<UpcomingItemReservationsDto> getUpcoming(Item item) async {
    try {
      final response = await dio.get(
        urls.itemUpcomingReservationsPath(item.qrCode),
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
