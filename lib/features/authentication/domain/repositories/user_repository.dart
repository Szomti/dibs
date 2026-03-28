import 'package:dibs/features/authentication/authentication.dart';

abstract class UserRepository {
  Stream<User?> get userStream;

  Future<User?> getUser();

  Future<User> login(String email, String password);
}
