import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart' as urls;
import '../dto/create_reservation_dto.dart';
import '../dto/user_reservations_dto.dart';

class ReservationRemoteDatasource extends RemoteDatasource {
  static const _perPageKey = 'per_page';
  static const _perPageValue = 10;
  static const _pageKey = 'page';

  ReservationRemoteDatasource(super.dio);

  Future<void> createReservation(CreateReservationDto dto) async {
    try {
      final response = await dio.post<Map<String, Object?>>(
        urls.reservations,
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

  Future<UserReservationsDto> getUserReservations(int page) async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        urls.reservations,
        options: jsonOptions,
        queryParameters: {_perPageKey: _perPageValue, _pageKey: page},
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return UserReservationsDto.fromJson(jsonObject);
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }

  Future<void> completeReservation(int reservationId) async {
    try {
      final response = await dio.put<Map<String, Object?>>(
        urls.completeReservation(reservationId),
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }

  Future<void> activateReservation(int reservationId) async {
    try {
      final response = await dio.put<Map<String, Object?>>(
        urls.activateReservation(reservationId),
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
    } on DioException {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
