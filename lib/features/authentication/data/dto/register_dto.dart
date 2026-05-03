import 'package:meta/meta.dart';

@immutable
final class RegisterDto {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  static const _confirmPasswordKey = 'password_confirmation';
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterDto({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, Object?> toJson() {
    return {
      _nameKey: name,
      _emailKey: email,
      _passwordKey: password,
      _confirmPasswordKey: confirmPassword,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterDto &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          confirmPassword == other.confirmPassword;

  @override
  int get hashCode => Object.hash(name, email, password, confirmPassword);
}
