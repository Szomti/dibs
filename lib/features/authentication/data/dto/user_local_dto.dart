class UserLocalDto {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';
  final String name;
  final String email;
  final String token;

  UserLocalDto({required this.name, required this.email, required this.token});

  factory UserLocalDto.fromJson(Map<String, Object?> jsonObject) {
    return UserLocalDto(
      name: jsonObject[_nameKey] as String,
      email: jsonObject[_emailKey] as String,
      token: jsonObject[_tokenKey] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {_nameKey: name, _emailKey: email, _tokenKey: token};
  }
}
