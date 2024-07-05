import 'package:dio/dio.dart';

class Crud {
  final Dio _dio = Dio();

  Future<dynamic> fetchData(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<void> postRequest(
      String url, Map<String, dynamic> data, Function(bool) onComplete) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        print('Done successfully');
        onComplete(true);
      } else if (response.statusCode == 400) {
        onComplete(false);
        print("Error 400: Bad request. Please check your input data.");
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }
}
