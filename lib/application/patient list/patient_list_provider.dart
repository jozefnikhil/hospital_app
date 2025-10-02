import 'dart:developer';

import 'package:amrita_treatment/domain/patient%20list/patientlist/patientlist.dart';
import 'package:amrita_treatment/infrastructure/patient%20list/patient_list_repo.dart';
import 'package:flutter/material.dart';

class PatientListProvider extends ChangeNotifier {
  final PatientListRepo _repo = PatientListRepo();
  bool _isLoading = false;
  Patientlist? _patientlist;
  String? _error;

  bool get isLoading => _isLoading;
  Patientlist? get patientlist => _patientlist;
  String? get error => _error;

  Future<void> patientList() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _repo.getPatientList();
      if (response != null) {
        _patientlist = response;
        log('its not null');
      } else {
        _error = "Invalid credentials";
      }
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
