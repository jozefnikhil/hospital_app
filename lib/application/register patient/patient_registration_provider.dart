import 'dart:developer';

import 'package:amrita_treatment/infrastructure/register%20patient/register_patient_repo.dart';
import 'package:flutter/material.dart';

class PatientRegistrationProvider extends ChangeNotifier {
  final RegisterPatientRepo _repo = RegisterPatientRepo();

  bool _isLoading = false;
  String? _error;
  bool _isSuccess = false; // optional, track if registration succeeded

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSuccess => _isSuccess;

  /// Call this to register a patient
  Future<void> registerPatient({
   required String name,
   required String payment,
   required String phone,
   required String address,
   required double totalamount,
   required double disamount,
   required double advamount,
   required double balamount,
   required String datntime,
   required String male,
   required String female,
   required String branch,
   required String treatment,
  }) async {
    _isLoading = true;
    _error = null;
    _isSuccess = false;
    notifyListeners();

    try {
      await _repo.registerPatient(
        address: address,
        advamount: advamount,
        balamount: balamount,
        branch: branch,
        datntime: datntime,
        disamount: disamount,
        female: female,
        male: male,
        name: name,
        payment: payment,
        phone: phone,
        totalamount: totalamount,
        treatment: treatment,
      );
      _isSuccess = true; // mark success if no exception
      log("Patient registered successfully.");
    } catch (e) {
      _error = e.toString();
      log("Error registering patient: $_error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
