import 'package:dibs/features/authentication/authentication.dart';
import 'package:dibs/features/authentication/presentation/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StreamProvider<User?>((ref) async* {
  final repo = ref.read(userRepositoryProvider);
  yield await repo.getUser();
  yield* repo.userStream;
});
