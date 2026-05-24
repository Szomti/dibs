import 'dart:async';

import '../../../../core/auth/auth_session.dart';
import '../../authentication.dart';
import '../datasource/user_local_datasource.dart';
import '../datasource/user_remote_datasource.dart';
import '../dto/login_dto.dart';
import '../dto/register_dto.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  final _localDatasource = UserLocalDatasource();
  final _userController = StreamController<User?>.broadcast();
  final UserRemoteDatasource _remoteDatasource;
  final AuthSession _session;
  User? _cache;

  UserRepositoryImpl(this._session, this._remoteDatasource) {
    _session.onExpired.listen((_) => _clearLocal());
  }

  @override
  Stream<User?> get userStream => _userController.stream;

  @override
  Future<User?> getUser() async {
    if (_cache != null) return _cache;
    final userDto = await _localDatasource.read();
    _setCache(userDto?.toEntity());
    return _cache;
  }

  @override
  Future<User> login(String email, String password) async {
    final userDto = await _remoteDatasource.login(
      LoginDto(email: email, password: password),
    );
    final user = userDto.toEntity();
    await _localDatasource.write(user.toLocalDto());
    _setCache(user);
    return _cache!;
  }

  @override
  Future<void> logout() async {
    _remoteDatasource.logout().ignore();
    _session.expire();
  }

  Future<void> _clearLocal() async {
    _setCache(null);
    await _localDatasource.delete();
  }

  @override
  Future<User> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final userDto = await _remoteDatasource.register(
      RegisterDto(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    final user = userDto.toEntity();
    await _localDatasource.write(user.toLocalDto());
    _setCache(user);
    return _cache!;
  }

  void _setCache(User? newUser) {
    if (newUser == _cache) return;
    _cache = newUser;
    _session.token = _cache?.token;
    _userController.add(_cache);
  }
}
