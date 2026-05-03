import 'package:meta/meta.dart';

@immutable
final class UserResponseDto {
  static const _userKey = 'user';
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';
  final String name;
  final String email;
  final String token;

  const UserResponseDto._({
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserResponseDto.fromJson(Map<String, Object?> jsonObject) {
    final userJsonObject = jsonObject[_userKey] as Map<String, Object?>;
    return UserResponseDto._(
      name: userJsonObject[_nameKey] as String,
      email: userJsonObject[_emailKey] as String,
      token: jsonObject[_tokenKey] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserResponseDto &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          token == other.token;

  @override
  int get hashCode => Object.hash(name, email, token);
}
