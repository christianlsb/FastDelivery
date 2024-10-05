import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

}
