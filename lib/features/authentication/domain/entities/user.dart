import 'package:flutter/foundation.dart';

@immutable
final class User {
  final String name;
  final String email;
  final String token;

  const User({
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          name == other.name &&
          email == other.email &&
          token == other.token;

  @override
  int get hashCode => Object.hash(name, email, token);
}
