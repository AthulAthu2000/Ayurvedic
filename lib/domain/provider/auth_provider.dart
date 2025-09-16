import 'package:ayurvedic_centre/data/services/api_services.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _token;

  bool get isLoading => _isLoading;
  String? get token => _token;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final responseData = await _apiService.login(username, password);
      _token = responseData['token'];
    } catch (e) {
      _token = null;
      // You can add more robust error handling here, like a specific message
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}