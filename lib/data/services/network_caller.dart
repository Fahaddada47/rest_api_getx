import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static Future<List<T>> getApi<T>(
      String url,
      T Function(Map<String, dynamic>) fromJson,
      ) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data.map<T>((item) => fromJson(item)).toList();
      }
    } catch (e) {
      print("Error in network request: $e");
    }
    return [];
  }
}
