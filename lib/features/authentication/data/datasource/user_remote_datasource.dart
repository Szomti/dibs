import 'package:dibs/features/authentication/data/dto/login_dto.dart';
import 'package:dibs/features/authentication/data/dto/register_dto.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/remote_datasource.dart';
import '../../../../core/network/urls.dart';
import '../dto/user_response_dto.dart';

final class UserRemoteDatasource extends RemoteDatasource {
  UserRemoteDatasource(super.dio);

  Future<UserResponseDto> login(LoginDto loginDto) async {
    try {
      final response = await dio.post<Map<String, Object?>>(
        loginPath,
        data: loginDto.toJson(),
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return UserResponseDto.fromJson(jsonObject);
    } on DioException catch (e) {
      // TODO: Custom exceptions
      rethrow;
    }
  }

  Future<UserResponseDto> register(RegisterDto registerDto) async {
    try {
      final response = await dio.post<Map<String, Object?>>(
        registerPath,
        data: registerDto.toJson(),
        options: jsonOptions,
      );
      final jsonObject = response.data;
      if (jsonObject == null) throw Exception('Received null from response');
      return UserResponseDto.fromJson(jsonObject);
    } on DioException catch (e) {
      // TODO: Custom exceptions
      rethrow;
    }
  }
}
