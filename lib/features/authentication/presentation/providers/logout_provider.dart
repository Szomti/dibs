import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_repository_provider.dart';

final logoutProvider = AsyncNotifierProvider.autoDispose<LogoutNotifier, void>(
  LogoutNotifier.new,
);

class LogoutNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(ref.read(userRepositoryProvider).logout);
  }
}
