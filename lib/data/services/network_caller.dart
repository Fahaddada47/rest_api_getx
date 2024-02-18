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
        var data = jsonDecode(response.body.toString()) as List<dynamic>;
        return data.map<T>((item) => fromJson(item as Map<String, dynamic>)).toList();
      } else {
        print("Error in network request: ${response.statusCode}");
        // You might want to throw an exception here based on your requirements.
        // Example: throw NetworkException("Failed to fetch data");
      }
    } catch (e) {
      print("Error in network request: $e");
      // Rethrow the exception for better debugging or handle it appropriately.
      // Example: rethrow;
    }
    return [];
  }
}
