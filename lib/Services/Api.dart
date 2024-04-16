import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();
  Future<Response> post({
    required body,
    required String Url,
    required String token,
    String? contentType,
  }) async {
    dynamic response = await dio.post(
      Url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    return response;
  }
}
