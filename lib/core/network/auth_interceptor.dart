import 'package:dio/dio.dart';

import '../auth/auth_session.dart';
import 'urls.dart' as urls;

final class AuthInterceptor extends Interceptor {
  final AuthSession _session;

  AuthInterceptor(this._session);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _session.token;
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.uri.path != Uri.parse(urls.logoutPath).path) {
      _session.expire();
    }
    handler.next(err);
  }
}
