import 'package:dibs/core/auth/auth_session.dart';
import 'package:dibs/core/network/dio_provider.dart';
import 'package:dibs/features/authentication/data/datasource/user_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    ref.watch(authSessionProvider),
    UserRemoteDatasource(ref.watch(dioProvider)),
  ),
);
