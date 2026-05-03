import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_session.dart';
import 'auth_interceptor.dart';
import 'request_logger_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(AuthInterceptor(ref.read(authSessionProvider)));
  dio.interceptors.add(RequestLoggerInterceptor());
  return dio;
});
