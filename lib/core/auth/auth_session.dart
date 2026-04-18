import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSessionProvider = Provider<AuthSession>((ref) => AuthSession());

final class AuthSession {
  String? token;
}
