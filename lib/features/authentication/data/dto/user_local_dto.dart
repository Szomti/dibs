import 'package:meta/meta.dart';

@immutable
final class UserLocalDto {
  static const _nameKey = 'name';
  static const _emailKey = 'email';
  static const _tokenKey = 'token';
  final String name;
  final String email;
  final String token;

  const UserLocalDto({
    required this.name,
    required this.email,
    required this.token,
  });

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalDto &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          token == other.token;

  @override
  int get hashCode => Object.hash(name, email, token);
}
