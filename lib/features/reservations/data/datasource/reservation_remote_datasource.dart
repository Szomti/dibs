import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../dto/create_reservation_dto.dart';

class ReservationRemoteDatasource extends RemoteDatasource {
  ReservationRemoteDatasource(super.dio);

  Future<void> createReservation(
    CreateReservationDto dto,
  ) async {
    try {
      final response = await dio.post(
        urls.createReservation,
        options: jsonOptions,
        data: dto.toJson(),
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
