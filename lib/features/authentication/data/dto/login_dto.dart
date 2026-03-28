final class LoginDto {
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  final String email;
  final String password;

  LoginDto({required this.email, required this.password});

  Map<String, Object?> toJson() {
    return {_emailKey: email, _passwordKey: password};
  }
}
