// import 'package:ayurvedic_centre/data/services/api_services.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   final ApiService _apiService = ApiService();
//   bool _isLoading = false;
//   String? _token;

//   bool get isLoading => _isLoading;
//   String? get token => _token;

//   Future<void> login(String username, String password) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final responseData = await _apiService.login(username, password);
//       _token = responseData['token'];
//     } catch (e) {
//       _token = null;
//       // You can add more robust error handling here, like a specific message
//       print(e);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
import 'package:ayurvedic_centre/data/services/api_services.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;

  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final responseData = await _apiService.login(username, password);

      // The ApiService now ensures a successful response, so we can be more confident here.
      if (responseData['token'] != null) {
        _token = responseData['token'];
        _errorMessage = null;
      } else {
        // This is a fallback for an unexpected successful response without a token.
        _token = null;
        _errorMessage = 'Login successful, but no token received.';
      }
    } catch (e) {
      // Catch the exception thrown by ApiService (which contains the API's error message).
      _token = null;
      // Clean up the "Exception: " prefix for a cleaner UI message.
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      // Notify listeners to update the UI with the new state (loading finished, error message set, etc.)
      notifyListeners();
    }
  }
}
