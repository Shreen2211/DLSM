import 'package:dio/dio.dart';
import 'package:dlsm/ViewModel/Data/Network/EndPoint.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response?> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response? response = await dio?.post(endPoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response?> get({
    required String endPoint,
  }) async {
    try {
      Response? response = await dio?.get(endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
