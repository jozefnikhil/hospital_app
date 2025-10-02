import 'dart:developer';

import 'package:amrita_treatment/domain/register%20patient/treatmentlist/treatmentlist.dart';
import 'package:amrita_treatment/infrastructure/register%20patient/treatment_list_repo.dart';
import 'package:flutter/material.dart';

class TreatmentlistProvider extends ChangeNotifier {
  final TreatmentListRepo _repo = TreatmentListRepo();
  bool _isLoading = false;
  Treatmentlist? _treatmentlist;
  String? _error;

  bool get isLoading => _isLoading;
  Treatmentlist? get treatmentlist => _treatmentlist;
  String? get error => _error;

  Future<void> gettreatmentlist() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _repo.getTreatmentlist();
      if (response != null) {
        _treatmentlist = response;
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
