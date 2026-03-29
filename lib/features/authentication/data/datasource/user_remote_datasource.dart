import 'package:dibs/features/authentication/data/dto/login_dto.dart';
import 'package:dibs/features/authentication/data/dto/register_dto.dart';

import '../../../../core/network/remote_datasource.dart';
import '../dto/user_dto.dart';

final class UserRemoteDatasource extends RemoteDatasource {
  final _tempDelay = const Duration(milliseconds: 500);

  UserRemoteDatasource();

  Future<UserDto> login(LoginDto loginDto) async {
    // final response = await dio.post<Map<String, Object?>>('<server>');
    // final jsonObject = response.data;
    // if (jsonObject == null) throw Exception('for later');
    // return UserDto.fromJson(jsonObject);
    // TODO: Finish when endpoint is available
    await Future.delayed(_tempDelay);
    return UserDto.fromJson({
      'username': 'Tester',
      'email': 'test@example.com',
      'token': 'TEMP_TOKEN',
    });
  }

  Future<void> register(RegisterDto registerDto) async {
    await Future.delayed(_tempDelay);
    // TODO: Finish when endpoint is available
  }
}
