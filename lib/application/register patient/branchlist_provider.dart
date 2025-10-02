import 'dart:developer';

import 'package:amrita_treatment/domain/register%20patient/branchlist/branchlist.dart';
import 'package:amrita_treatment/infrastructure/register%20patient/branch_list_repo.dart';
import 'package:flutter/material.dart';

class BranchlistProvider extends ChangeNotifier {
  final BranchListRepo _repo = BranchListRepo();
  bool _isLoading = false;
  Branchlist? _branchlist;
  String? _error;

  bool get isLoading => _isLoading;
  Branchlist? get branchlist => _branchlist;
  String? get error => _error;

  Future<void> getbranchlist() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _repo.getBranchList();
      if (response != null) {
        _branchlist = response;
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
