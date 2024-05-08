import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  postRequest(String url, Map data, Function(bool) onComplete) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
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
