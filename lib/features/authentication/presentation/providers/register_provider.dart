import 'dart:async';

import 'package:dibs/features/authentication/presentation/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';

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
