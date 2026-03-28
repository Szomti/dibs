import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/presentation/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
