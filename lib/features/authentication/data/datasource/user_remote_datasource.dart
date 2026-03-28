import 'package:dibs/features/authentication/data/dto/login_dto.dart';

import '../../../../core/network/remote_datasource.dart';
import '../dto/user_dto.dart';

final class UserRemoteDatasource extends RemoteDatasource {
  UserRemoteDatasource();

  Future<UserDto> login(LoginDto loginDto) async {
    // final response = await dio.post<Map<String, Object?>>('<server>');
    // final jsonObject = response.data;
    // if (jsonObject == null) throw Exception('for later');
    // return UserDto.fromJson(jsonObject);
    await Future.delayed(const Duration(milliseconds: 500));
    return UserDto.fromJson({
      'username': 'Tester',
      'email': 'test@example.com',
      'token': 'TEMP_TOKEN'
    });
  }
}
