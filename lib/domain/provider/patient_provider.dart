// domain/providers/patient_provider.dart

import 'package:ayurvedic_centre/data/services/api_services.dart';
import 'package:flutter/material.dart';


class PatientProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final String _token; // The token from the AuthProvider
  
  List<dynamic>? _patients;
  bool _isLoading = false;
  String? _errorMessage;

  PatientProvider(this._token);

  List<dynamic>? get patients => _patients;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPatients() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final responseData = await _apiService.getPatientList(_token);
      _patients = responseData['patient']; // Assuming the key is 'patients'
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}