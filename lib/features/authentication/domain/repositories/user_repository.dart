import 'package:dibs/features/authentication/authentication.dart';

abstract class UserRepository {
  Stream<User?> get userStream;

  Future<User?> getUser();

  Future<User> login(String email, String password);

  Future<User> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
}
