import 'dart:async';

import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/data/datasource/user_local_datasource.dart';
import 'package:dibs/features/authentication/data/datasource/user_remote_datasource.dart';
import 'package:dibs/features/authentication/data/dto/login_dto.dart';
import 'package:dibs/features/authentication/data/mappers/user_mapper.dart';

import '../dto/user_dto.dart';

class UserRepositoryImpl extends UserRepository {
  final _localDatasource = UserLocalDatasource();
  final _remoteDatasource = UserRemoteDatasource();
  final _userController = StreamController<User?>.broadcast();
  User? _cache;

  @override
  Stream<User?> get userStream => _userController.stream;

  @override
  Future<User?> getUser() async {
    if (_cache != null) return _cache;
    final userDto = await _localDatasource.read();
    _setCache(userDto);
    return _cache;
  }

  @override
  Future<User> login(String email, String password) async {
    final userDto = await _remoteDatasource.login(
      LoginDto(email: email, password: password),
    );
    await _localDatasource.write(userDto);
    _setCache(userDto);
    return _cache!;
  }

  void _setCache(UserDto? userDto) {
    final newUser = userDto?.toEntity();
    if (newUser == _cache) return;
    _cache = newUser;
    _userController.add(_cache);
  }
}
