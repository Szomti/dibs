import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => UserRepositoryImpl());

final loginProvider = AsyncNotifierProvider.autoDispose<LoginProvider, User?>(
  LoginProvider.new,
);

class LoginProvider extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async => null;

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(repositoryProvider).login(email, password),
    );
  }
}
