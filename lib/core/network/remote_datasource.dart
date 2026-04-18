import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  final Dio dio;

  RemoteDatasource(this.dio);

  Options get jsonOptions => Options(
    contentType: Headers.jsonContentType,
    headers: {Headers.acceptHeader: Headers.jsonContentType},
  );
}
