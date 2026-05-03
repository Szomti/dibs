import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../logging/soft_wrap_pretty_printer.dart';

final class RequestLoggerInterceptor extends Interceptor {
  static final _logger = Logger(
    printer: SoftWrapPrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTime,
      methodCount: 0,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.d(
      '${response.statusCode} ${response.requestOptions.method} '
      '${response.requestOptions.uri}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final res = err.response;
    final message = ((res?.data['message'] as String?) ?? '');
    final errorType = '(${err.type.name})';
    _logger.w(
      '${res?.statusCode ?? 'no-response'} '
      '${err.requestOptions.method} ${err.requestOptions.uri} '
      '${message.isNotEmpty ? '\n$errorType $message' : errorType}',
    );
    handler.next(err);
  }
}
