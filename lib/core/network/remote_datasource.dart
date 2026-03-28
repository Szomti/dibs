import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  final dio = Dio();
}