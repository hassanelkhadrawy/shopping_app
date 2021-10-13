import 'package:dio/dio.dart';
import 'package:shopping_app/constants/Strings/strings.dart';

class WebServices {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: BaseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true));
  }

  Future<Response> PostData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
        String? lang = 'en',
      }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': UserToken};
    return await dio!.post(url, data: data);
  }

  Future<Response> getData(
      {required String url,
      Map<String, dynamic>? qury,
      String? lang = 'en',
      String? token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': UserToken};
    return await dio!.get(url, queryParameters: qury);
  }
}
