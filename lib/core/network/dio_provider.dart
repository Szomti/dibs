import 'package:dibs/core/auth/auth_session.dart';
import 'package:dibs/core/network/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(AuthInterceptor(ref.read(authSessionProvider)));
  return dio;
});
