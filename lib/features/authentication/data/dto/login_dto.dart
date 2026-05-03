import 'package:meta/meta.dart';

@immutable
final class LoginDto {
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  final String email;
  final String password;

  const LoginDto({required this.email, required this.password});

  Map<String, Object?> toJson() {
    return {_emailKey: email, _passwordKey: password};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginDto &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => Object.hash(email, password);
}
