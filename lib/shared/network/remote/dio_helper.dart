import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true));
  }

// Create GetData Fun() {}

  static Future<Response?> getData(
      {required String path,
        required Map<String, dynamic> query}) async {
    return await dio?.get(path, queryParameters: query);
  }
}
