import 'package:dibs/features/authentication/authentication.dart';

abstract class UserRepository {
  Future<User?> getUser();

  Future<User> login(String email, String password);
}
