import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoadingDestination { login, home }

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(),
);

final loadingProvider = FutureProvider<LoadingDestination>((ref) async {
  final user = await ref.read(userRepositoryProvider).getUser();
  if (user == null) return LoadingDestination.login;
  return LoadingDestination.home;
});
