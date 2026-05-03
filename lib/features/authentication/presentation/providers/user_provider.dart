import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication.dart';
import 'user_repository_provider.dart';

final userProvider = StreamProvider<User?>((ref) async* {
  final repo = ref.read(userRepositoryProvider);
  yield await repo.getUser();
  yield* repo.userStream;
});
