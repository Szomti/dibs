import 'dart:async';

import 'package:dibs/features/authentication/presentation/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider =
    AsyncNotifierProvider.autoDispose<RegisterNotifier, bool>(
      RegisterNotifier.new,
    );

class RegisterNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() => false;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(userRepositoryProvider);
    state = await AsyncValue.guard(
      () async => repository.register(name, email, password),
    );
  }
}
