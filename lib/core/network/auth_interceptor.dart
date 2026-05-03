import 'package:dio/dio.dart';

import '../auth/auth_session.dart';

final class AuthInterceptor extends Interceptor {
  final AuthSession _session;

  AuthInterceptor(this._session);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _session.token;
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
