import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import 'user_repository_provider.dart';

final registerProvider =
    AsyncNotifierProvider.autoDispose<RegisterNotifier, User?>(
      RegisterNotifier.new,
    );

class RegisterNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() => null;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(userRepositoryProvider);
    state = await AsyncValue.guard(
      () async => repository.register(name, email, password, confirmPassword),
    );
  }
}
