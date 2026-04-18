class UserResponseDto {
  static const _userKey = 'user';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';
  final String name;
  final String email;
  final String token;

  UserResponseDto._({required this.name, required this.email, required this.token});

  factory UserResponseDto.fromJson(Map<String, Object?> jsonObject) {
    final userJsonObject = jsonObject[_userKey] as Map<String, Object?>;
    return UserResponseDto._(
      name: userJsonObject[_nameKey] as String,
      email: userJsonObject[_emailKey] as String,
      token: jsonObject[_tokenKey] as String,
    );
  }
}
