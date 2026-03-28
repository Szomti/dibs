import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/data/datasource/user_local_datasource.dart';
import 'package:dibs/features/authentication/data/datasource/user_remote_datasource.dart';
import 'package:dibs/features/authentication/data/dto/login_dto.dart';
import 'package:dibs/features/authentication/data/mappers/user_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<User?> getUser() async {
    final userDto = await UserLocalDatasource().read();
    if (userDto == null) return null;
    return userDto.toEntity();
  }

  @override
  Future<User> login(String email, String password) async {
    final userDto = await UserRemoteDatasource().login(
      LoginDto(email: email, password: password),
    );
    return userDto.toEntity();
  }
}
