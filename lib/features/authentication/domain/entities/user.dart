final class User {
  final String username;
  final String email;
  final String token;

  User({required this.username, required this.email, required this.token});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          username == other.username &&
          email == other.email &&
          token == other.token;

  @override
  int get hashCode => Object.hash(username, email, token);
}
