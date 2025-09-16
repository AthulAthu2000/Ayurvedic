import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('${_baseUrl}Login');
    
    // The http package handles encoding the body as form data by default.
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login. Status code: ${response.statusCode}');
    }
  }
}