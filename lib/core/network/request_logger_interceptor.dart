import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final class RequestLoggerInterceptor extends Interceptor {
  static final _logger = Logger(
    printer: PrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTime,
      methodCount: 0,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('Request: ${options.uri}');
    handler.next(options);
  }
}
