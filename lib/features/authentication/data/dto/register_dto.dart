class RegisterDto {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  final String name;
  final String email;
  final String password;

  RegisterDto({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, Object?> toJson() {
    return {_nameKey: name, _emailKey: email, _passwordKey: password};
  }
}
