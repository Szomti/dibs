class UserDto {
  static const _usernameKey = 'username';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';
  final String username;
  final String email;
  final String token;

  UserDto._({required this.username, required this.email, required this.token});

  factory UserDto.fromJson(Map<String, Object?> jsonObject) {
    return UserDto._(
      username: jsonObject[_usernameKey] as String,
      email: jsonObject[_emailKey] as String,
      token: jsonObject[_tokenKey] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {_usernameKey: username, _emailKey: email, _tokenKey: token};
  }
}
