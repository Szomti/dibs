import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSessionProvider = Provider<AuthSession>((ref) => AuthSession());

final class AuthSession {
  String? token;
  final _expired = StreamController<void>.broadcast();

  Stream<void> get onExpired => _expired.stream;

  void expire() {
    if (token == null) return;
    token = null;
    _expired.add(null);
  }

  void dispose() => _expired.close();
}
