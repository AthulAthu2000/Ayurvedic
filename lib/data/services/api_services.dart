import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl Login');

    // The http package handles encoding the body as form data by default.
    final response = await http.post(
      url,
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      String errorMessage =
          'Failed to login. Status code: ${response.statusCode}';
      try {
        // Try to parse a more specific error message from the response body.
        final errorData = json.decode(response.body);
        if (errorData['message'] != null) errorMessage = errorData['message'];
      } catch (_) {} // Ignore if body isn't valid JSON or has no message.
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> getPatientList(String token) async {
    final url = Uri.parse('$_baseUrl PatientList');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      String errorMessage =
          'Failed to load patient list. Status code: ${response.statusCode}';
      try {
        // Try to parse a more specific error message from the response body.
        final errorData = json.decode(response.body);
        if (errorData['message'] != null) errorMessage = errorData['message'];
      } catch (_) {} // Ignore if body isn't valid JSON or has no message.
      throw Exception(errorMessage);
    }
  }
}
