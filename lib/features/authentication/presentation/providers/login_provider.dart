import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication.dart';
import 'user_repository_provider.dart';

final loginProvider = AsyncNotifierProvider.autoDispose<LoginNotifier, User?>(
  LoginNotifier.new,
);

class LoginNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async => null;

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).login(email, password),
    );
  }
}
